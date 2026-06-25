#!/usr/bin/env python3
"""
Combinar contenido de slides + CSS de tema → HTML final de Marp
Uso: python combine.py <tema> [output]
Ejemplo: python combine.py build2026 build2026-final.html
"""

import sys
import os
import re

def extract_slides(output='slides.html'):
    """Extraer solo el contenido de las slides del marp.html original"""
    marp_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'microsoft-build-2026.marp.html')
    if not os.path.exists(marp_path):
        print(f"ERROR: {marp_path} no existe")
        sys.exit(1)
    
    with open(marp_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    slide_match = re.search(r'</style>(.*?)</html>', content, re.DOTALL)
    if slide_match:
        slides_html = slide_match.group(1)
        with open(output, 'w', encoding='utf-8') as f:
            f.write(slides_html)
        print(f"[OK] slides.html extraido ({len(slides_html)} chars)")
        return output
    else:
        print("ERROR: No se encontraron slides")
        sys.exit(1)

def combine(theme_name, output=None):
    base_dir = os.path.dirname(os.path.abspath(__file__))
    themes_dir = os.path.join(base_dir, 'themes')
    
    # Leer contenido de slides
    slides_path = os.path.join(base_dir, 'slides.html')
    if not os.path.exists(slides_path):
        print(f"⚠️  {slides_path} no existe. Extrayendo...")
        extract_slides()
    
    with open(slides_path, 'r', encoding='utf-8') as f:
        slides_html = f.read()
    
    # Leer base.css
    base_css_path = os.path.join(themes_dir, 'base.css')
    with open(base_css_path, 'r', encoding='utf-8') as f:
        base_css = f.read()
    
    # Leer tema específico
    theme_css_path = os.path.join(themes_dir, f'{theme_name}.css')
    if not os.path.exists(theme_css_path):
        print(f"ERROR: Tema '{theme_name}' no existe en themes/")
        print(f"Temas disponibles: {os.listdir(themes_dir)}")
        sys.exit(1)
    
    with open(theme_css_path, 'r', encoding='utf-8') as f:
        theme_css = f.read()
    
    # Combinar: base + theme + slides
    final_html = f"""<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Presentación — {theme_name.title()}</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@marp-team/marp-core@3/dist/marp.min.css">
  <style>
{base_css}
{theme_css}
  </style>
</head>
<body>
{slides_html}
</body>
</html>
"""
    
    if output is None:
        output = f'{theme_name}-final.html'
    
    with open(output, 'w', encoding='utf-8') as f:
        f.write(final_html)
    
    print(f"[OK] {output} generado ({len(final_html)} chars)")
    return output

if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1] == '--extract':
        output = sys.argv[2] if len(sys.argv) > 2 else 'slides.html'
        extract_slides(output)
    else:
        theme = sys.argv[1] if len(sys.argv) > 1 else 'build2026'
        output = sys.argv[2] if len(sys.argv) > 2 else None
        combine(theme, output)
