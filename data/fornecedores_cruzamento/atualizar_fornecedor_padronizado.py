#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para atualizar a coluna fornecedor_padronizado no arquivo uniao_64k.csv
Uso: python atualizar_fornecedor_padronizado.py "PADRÃO DE BUSCA" "FORNECEDOR PADRONIZADO"
"""

import csv
import sys
import re
from pathlib import Path

ARQUIVO = Path('data/base/uniao_64k.csv')
ARQUIVO_TEMP = Path('data/base/uniao_64k_temp.csv')

def normalizar_texto(texto):
    """Remove acentos e normaliza texto para comparação"""
    if not texto:
        return ''
    texto = texto.lower()
    # Remove acentos
    replacements = {
        'á': 'a', 'à': 'a', 'ã': 'a', 'â': 'a',
        'é': 'e', 'ê': 'e', 'è': 'e',
        'í': 'i', 'ì': 'i', 'î': 'i',
        'ó': 'o', 'ô': 'o', 'õ': 'o', 'ò': 'o',
        'ú': 'u', 'ù': 'u', 'û': 'u',
        'ç': 'c'
    }
    for old, new in replacements.items():
        texto = texto.replace(old, new)
    return texto

def adicionar_coluna():
    """Adiciona a coluna fornecedor_padronizado se não existir"""
    print("🔍 Verificando se a coluna fornecedor_padronizado existe...")
    
    with ARQUIVO.open('r', encoding='utf-8') as f:
        reader = csv.DictReader(f, delimiter=';')
        fieldnames = reader.fieldnames
        
        if 'fornecedor_padronizado' in fieldnames:
            print("✅ Coluna já existe!")
            return
        
        print("➕ Adicionando coluna fornecedor_padronizado...")
        new_fieldnames = list(fieldnames) + ['fornecedor_padronizado']
        
        rows = []
        for row in reader:
            row['fornecedor_padronizado'] = ''
            rows.append(row)
    
    # Escreve arquivo com nova coluna
    with ARQUIVO_TEMP.open('w', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=new_fieldnames, delimiter=';')
        writer.writeheader()
        writer.writerows(rows)
    
    # Substitui arquivo original
    ARQUIVO_TEMP.replace(ARQUIVO)
    print(f"✅ Coluna adicionada! Total de linhas: {len(rows)}")

def atualizar_fornecedor(padrao_busca, fornecedor_padronizado, caso_sensivel=False):
    """Atualiza fornecedor_padronizado para linhas que correspondem ao padrão"""
    print(f"\n🔄 Atualizando fornecedor: {fornecedor_padronizado}")
    print(f"🔍 Padrão de busca: {padrao_busca}")
    
    with ARQUIVO.open('r', encoding='utf-8') as f:
        reader = csv.DictReader(f, delimiter=';')
        fieldnames = reader.fieldnames
        
        if 'fornecedor_padronizado' not in fieldnames:
            print("❌ Erro: Coluna fornecedor_padronizado não existe. Execute adicionar_coluna() primeiro.")
            return
        
        rows = []
        count_atualizados = 0
        count_ja_preenchidos = 0
        
        for row in reader:
            cliente_fornecedor = row.get('cliente_fornecedor', '')
            fornecedor_atual = row.get('fornecedor_padronizado', '')
            
            # Verifica se corresponde ao padrão
            if caso_sensivel:
                match = padrao_busca in cliente_fornecedor
            else:
                match = normalizar_texto(padrao_busca) in normalizar_texto(cliente_fornecedor)
            
            if match:
                if fornecedor_atual and fornecedor_atual != fornecedor_padronizado:
                    count_ja_preenchidos += 1
                    print(f"⚠️  Linha já tinha: '{fornecedor_atual}' (será sobrescrito)")
                
                row['fornecedor_padronizado'] = fornecedor_padronizado
                count_atualizados += 1
            
            rows.append(row)
    
    # Escreve arquivo atualizado
    with ARQUIVO_TEMP.open('w', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, delimiter=';')
        writer.writeheader()
        writer.writerows(rows)
    
    # Substitui arquivo original
    ARQUIVO_TEMP.replace(ARQUIVO)
    
    print(f"✅ Atualizado! {count_atualizados} linhas modificadas")
    if count_ja_preenchidos > 0:
        print(f"⚠️  {count_ja_preenchidos} linhas foram sobrescritas")

def mostrar_fornecedores_sem_padronizar(limite=50):
    """Mostra fornecedores ainda sem padronização"""
    print("\n📋 Fornecedores sem padronização:")
    
    with ARQUIVO.open('r', encoding='utf-8') as f:
        reader = csv.DictReader(f, delimiter=';')
        
        fornecedores_vazios = {}
        
        for row in reader:
            fornecedor_atual = row.get('fornecedor_padronizado', '').strip()
            cliente_fornecedor = row.get('cliente_fornecedor', '').strip()
            
            if not fornecedor_atual and cliente_fornecedor:
                if cliente_fornecedor not in fornecedores_vazios:
                    fornecedores_vazios[cliente_fornecedor] = 0
                fornecedores_vazios[cliente_fornecedor] += 1
        
        # Ordena por quantidade
        fornecedores_ordenados = sorted(
            fornecedores_vazios.items(), 
            key=lambda x: x[1], 
            reverse=True
        )[:limite]
        
        print(f"\nTop {limite} fornecedores sem padronização:")
        for fornecedor, count in fornecedores_ordenados:
            print(f"  {count:5d}x - {fornecedor}")
        
        total_sem_padronizar = sum(fornecedores_vazios.values())
        print(f"\n📊 Total de linhas sem fornecedor_padronizado: {total_sem_padronizar}")

if __name__ == '__main__':
    if len(sys.argv) == 1:
        # Sem argumentos: adiciona coluna se necessário
        adicionar_coluna()
        mostrar_fornecedores_sem_padronizar()
    elif len(sys.argv) == 3:
        # Com 2 argumentos: atualiza fornecedor
        padrao = sys.argv[1]
        fornecedor = sys.argv[2]
        atualizar_fornecedor(padrao, fornecedor)
    else:
        print("Uso:")
        print("  python atualizar_fornecedor_padronizado.py")
        print("    -> Adiciona coluna e mostra fornecedores sem padronização")
        print()
        print("  python atualizar_fornecedor_padronizado.py 'PADRÃO' 'FORNECEDOR'")
        print("    -> Atualiza linhas que contêm PADRÃO com FORNECEDOR")
        print()
        print("Exemplo:")
        print("  python atualizar_fornecedor_padronizado.py 'OPTOTAL' 'OPTOTAL HOYA LTDA'")
