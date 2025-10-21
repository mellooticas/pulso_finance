#!/usr/bin/env python3
# Analisa imagens em data/base/images e gera um resumo CSV + diagnóstico
from pathlib import Path
import hashlib
import json
from PIL import Image, ExifTags
import pandas as pd

PASTA = Path('data/base/images')
RESUMO_CSV = Path('data/base/images_resumo.csv')
DUPLICATAS_CSV = Path('data/base/images_duplicatas.csv')
RELATORIO_JSON = Path('data/base/images_relatorio.json')


def hash_arquivo(path: Path, chunk=8192):
    h = hashlib.md5()
    with open(path, 'rb') as f:
        while True:
            b = f.read(chunk)
            if not b:
                break
            h.update(b)
    return h.hexdigest()


def analisar_imagem(path: Path):
    info = {
        'arquivo': path.name,
        'caminho': str(path),
        'tamanho_bytes': path.stat().st_size,
        'hash_md5': hash_arquivo(path),
        'largura': None,
        'altura': None,
        'formato': None,
        'exif': {},
        'erro': None,
    }
    try:
        with Image.open(path) as img:
            info['largura'], info['altura'] = img.size
            info['formato'] = img.format
            # EXIF (nem todo PNG/JPG terá)
            try:
                exif_raw = img.getexif()
                if exif_raw:
                    exif = {}
                    for k, v in exif_raw.items():
                        nome = ExifTags.TAGS.get(k, str(k))
                        exif[nome] = str(v)
                    info['exif'] = exif
            except Exception:
                pass
    except Exception as e:
        info['erro'] = str(e)
    return info


def main():
    arquivos = [p for p in PASTA.iterdir() if p.is_file()]
    registros = [analisar_imagem(p) for p in arquivos]

    df = pd.DataFrame(registros)
    df.to_csv(RESUMO_CSV, index=False, encoding='utf-8')

    # Duplicatas por hash
    dup = (
        df.groupby('hash_md5')
        .filter(lambda g: len(g) > 1)
        .sort_values(['hash_md5', 'tamanho_bytes'])
    )
    dup.to_csv(DUPLICATAS_CSV, index=False, encoding='utf-8')

    # Relatório agregado
    # Dimensões com chave string "LxA" para JSON
    dims_series = df[['largura', 'altura']].value_counts().head(10)
    dims_dict = {f"{int(l) if pd.notna(l) else 'NA'}x{int(a) if pd.notna(a) else 'NA'}": int(cnt)
                 for (l, a), cnt in dims_series.items()}

    rel = {
        'total_arquivos': int(len(df)),
        'formatos': {str(k): int(v) for k, v in df['formato'].fillna('desconhecido').value_counts().to_dict().items()},
        'dimensoes_top': dims_dict,
        'duplicatas': int(len(dup)),
        'arquivos_com_erro': int(df['erro'].notna().sum()) if 'erro' in df.columns else 0,
    }
    RELATORIO_JSON.write_text(json.dumps(rel, indent=2, ensure_ascii=False), encoding='utf-8')

    print('✅ Análise concluída:')
    print(f'- Resumo: {RESUMO_CSV}')
    print(f'- Duplicatas: {DUPLICATAS_CSV}')
    print(f'- Relatório: {RELATORIO_JSON}')
    print('\nEstatísticas:')
    print(json.dumps(rel, indent=2, ensure_ascii=False))

if __name__ == '__main__':
    main()
