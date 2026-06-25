# Build 2026 Presentation — AI Agent Instructions

## Project Overview

This is a presentation project about **Microsoft Build 2026 announcements**, focused on GitHub Copilot, MAI (Model AI Agent), and the agentic future. The presentation is built using **Marp** (Markdown Presentation) with a theme system and automated pipeline to generate PPTX/PDF outputs.

## Key Files & Directories

- `slides.html` — Main slide content (Markdown/HTML)
- `themes/` — CSS theme system
  - `base.css` — Shared layout, cards, grids, typography base (DO NOT modify theme-specific styles here)
  - `build2026.css` — Build 2026 official theme (black/yellow/blue)
  - `azurebrains.css` — AzureBrains branding theme
- `combine.py` — Python script to combine slides + theme → final HTML
- `Makefile` — Build system for generating PPTX/PDF
- `generate-pdf.js` — Puppeteer-based PDF generation fallback
- `material_presentacion.json` — Presentation material with research data
- `presentation_videos.json` — Video references for slides
- `themes/README.md` — Theme system documentation

## Build Commands

```bash
make build2026-pptx     # Generate PPTX with Build 2026 theme
make azurebrains-pptx   # Generate PPTX with AzureBrains theme
make all-pptx           # Generate all PPTX themes
make build2026-pdf      # Generate PDF with Build 2026 theme
make all-pdf            # Generate all PDFs
make all                # Generate everything (PPTX + PDF)
make clean              # Clean generated files
```

## Theme Architecture

1. **`base.css`** — Layout components: cards, grids, badges, videos, metrics
2. **Theme CSS** — Only colors (`:root`), hero styling, typography, decorations
3. **To create a new theme**: Copy `build2026.css` → `nuevo-tema.css`, change `:root` variables, add to Makefile

## Development Workflow

1. Edit `slides.html` for content changes
2. Run `make <tema>-pptx` or `make <tema>-pdf` to build
3. Preview in browser: `open <tema>-final.html`

## Important Notes

- All CSS uses CSS custom properties (`--theme-*`) for theming
- Slides use semantic classes: `.hero`, `.content`, `.card-grid`, `.card`, `.divider`
- Video embeds use YouTube iframes with responsive containers
- Images are hosted on `https://svg153.github.io/build-2026-presentation/`
- The pipeline is: `slides.html` + `theme.css` → `combine.py` → HTML → PDF → PPTX
