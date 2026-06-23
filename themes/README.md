# Marp Theme System

## Arquitectura

```
themes/
├── base.css          ← Estilos comunes (layout, cards, grids, typography base)
├── build2026.css     ← Tema Build 2026 (colores, hero, pixel-art)
├── azurebrains.css   ← Tema AzureBrains (colores, logo, branding)
└── README.md         ← Cómo crear nuevos temas
```

## Cómo funciona

1. **`base.css`** — Todo lo que es layout común: cards, grids, badges, videos, metrics, two-col, footer
2. **Tema específico** — Solo cambia: colores (:root), hero styling, tipografía, decoraciones

## Crear un nuevo tema

1. Copiar `build2026.css` → `nuevo-tema.css`
2. Cambiar las variables en `:root`
3. Ajustar hero y decoraciones
4. Añadir a Makefile: `make nuevo-tema-pptx`

## Generar PPTX

```bash
make build2026-pptx      # Genera build2026.pptx
make azurebrains-pptx    # Genera azurebrains.pptx
make all-pptx            # Genera todos los temas
make build2026-pdf       # Genera build2026.pdf
make all-pdf             # Genera todos los PDFs
```

## Pipeline

```
slides.md (contenido) + theme.css (diseño) 
  → marp slides.html 
  → pandas / libreoffice / chrome --print 
  → output.pptx
```
