NR==1 { h1=$0; next }
NR==2 { h2=$0; next }
{ lines[c++] = $0 }
END {
  b = 200; f = 1;
  for (i = 0; i < c; i += b) {
    outfile = sprintf("%s/fornecedores_lote_%03d.sql", outdir, f++);
    print h1 > outfile;
    print h2 >> outfile;
    for (j = i; j < i + b && j < c; j++) {
      line = lines[j];
      if (j == i + b - 1 || j == c - 1) {
        sub(/,\s*$/, ";", line);
        sub(/\),\s*$/, ");", line);
      }
      print line >> outfile;
    }
  }
}
