# ============================================================
# Makefile — Generar PPTX/PDF con diferentes temas
# ============================================================
#
# Temas disponibles: build2026, azurebrains
#
# Uso:
#   make build2026-pptx    # Genera build2026.pptx
#   make azurebrains-pptx  # Genera azurebrains.pptx
#   make all-pptx          # Genera todos los PPTX
#   make build2026-pdf     # Genera build2026.pdf
#   make all-pdf           # Genera todos los PDFs
#   make all               # Genera todo (pptx + pdf)
#   make extract-slides    # Extrae contenido de marp.html
#   make combine           # Combina slides + tema → HTML
#   make clean             # Limpia archivos generados
# ============================================================

.PHONY: all clean build2026-pptx azurebrains-pptx all-pptx \
        build2026-pdf azurebrains-pdf all-pdf \
        build2026-html azurebrains-html \
        extract-slides combine help

# Temas disponibles
THEMES := build2026 azurebrains

# Herramientas
MARP=npx @marp-team/marp-cli
CHROME=$(shell which google-chrome 2>/dev/null || which chromium 2>/dev/null || which chromium-browser 2>/dev/null || echo "")
LIBREOFFICE=$(shell which libreoffice 2>/dev/null || echo "")

# ============================================================
# Extract slides from original marp.html
# ============================================================
extract-slides:
	@echo "📄 Extrayendo contenido de slides..."
	@python3 combine.py --extract slides.html
	@echo "✅ slides.html extraído"

# ============================================================
# Combine slides + theme → final HTML
# ============================================================
combine-%:
	@echo "🎨 Combinando slides + tema $*..."
	@python3 combine.py $* $*-final.html
	@echo "✅ $*-final.html generado"

# ============================================================
# HTML generation
# ============================================================
build2026-html: combine-build2026
	@echo "✅ build2026-final.html listo"

azurebrains-html: combine-azurebrains
	@echo "✅ azurebrains-final.html listo"

# ============================================================
# PDF generation (requires Chrome/Chromium or Marp CLI)
# ============================================================
# Prerequisites: Google Chrome, Chromium, or Marp CLI installed
# Install: apt install chromium-browser  ||  npm i -g @marp-team/marp-cli
# ============================================================
build2026-pdf: build2026-html
	@if [ -n "$(CHROME)" ]; then \
		echo "📄 Generando PDF con Chrome headless..."; \
		$(CHROME) --headless --disable-gpu --no-sandbox --print-to-pdf=build2026.pdf build2026-final.html; \
		echo "✅ build2026.pdf generado"; \
	else \
		echo "⚠️  Chrome/Chromium no encontrado."; \
		echo "   Opción 1: apt install chromium-browser"; \
		echo "   Opción 2: npm i -g @marp-team/marp-cli && make build2026-pdf"; \
		echo "   Opción 3: Abrir build2026-final.html en el navegador → Ctrl+P → Guardar como PDF"; \
	fi

azurebrains-pdf: azurebrains-html
	@if [ -n "$(CHROME)" ]; then \
		echo "📄 Generando PDF con Chrome headless..."; \
		$(CHROME) --headless --disable-gpu --no-sandbox --print-to-pdf=azurebrains.pdf azurebrains-final.html; \
		echo "✅ azurebrains.pdf generado"; \
	else \
		echo "⚠️  Chrome/Chromium no encontrado."; \
		echo "   Opción 1: apt install chromium-browser"; \
		echo "   Opción 2: npm i -g @marp-team/marp-cli && make azurebrains-pdf"; \
		echo "   Opción 3: Abrir azurebrains-final.html en el navegador → Ctrl+P → Guardar como PDF"; \
	fi

all-pdf: $(addsuffix -pdf,$(THEMES))
	@echo "✅ Todos los PDFs generados"

# ============================================================
# PPTX generation (via LibreOffice)
# ============================================================
build2026-pptx: build2026-pdf
	@if [ -n "$(LIBREOFFICE)" ]; then \
		echo "📊 Convirtiendo PDF → PPTX con LibreOffice..."; \
		$(LIBREOFFICE) --headless --convert-to pptx build2026.pdf --outdir .; \
		echo "✅ build2026.pptx generado"; \
	else \
		echo "⚠️  LibreOffice no encontrado. Intentando con pandoc..."; \
		if command -v pandoc &>/dev/null; then \
			pandoc build2026-final.html -o build2026.pptx; \
			echo "✅ build2026.pptx generado con pandoc"; \
		else \
			echo "❌ Ni LibreOffice ni pandoc disponibles."; \
			echo "   Instala LibreOffice: apt install libreoffice"; \
			echo "   O convierte manualmente: libreoffice --headless --convert-to pptx build2026.pdf"; \
		fi \
	fi

azurebrains-pptx: azurebrains-pdf
	@if [ -n "$(LIBREOFFICE)" ]; then \
		echo "📊 Convirtiendo PDF → PPTX con LibreOffice..."; \
		$(LIBREOFFICE) --headless --convert-to pptx azurebrains.pdf --outdir .; \
		echo "✅ azurebrains.pptx generado"; \
	else \
		echo "⚠️  LibreOffice no encontrado. Intentando con pandoc..."; \
		if command -v pandoc &>/dev/null; then \
			pandoc azurebrains-final.html -o azurebrains.pptx; \
			echo "✅ azurebrains.pptx generado con pandoc"; \
		else \
			echo "❌ Ni LibreOffice ni pandoc disponibles."; \
			echo "   Instala LibreOffice: apt install libreoffice"; \
			echo "   O convierte manualmente: libreoffice --headless --convert-to pptx azurebrains.pdf"; \
		fi \
	fi

all-pptx: $(addsuffix -pptx,$(THEMES))
	@echo "✅ Todos los PPTX generados"

# ============================================================
# Generate all
# ============================================================
all: all-pptx all-pdf
	@echo ""
	@echo "============================================"
	@echo "✅ TODO GENERADO:"
	@for theme in $(THEMES); do \
		echo "  📄 $$theme-final.html"; \
		echo "  📋 $$theme.pdf"; \
		echo "  📊 $$theme.pptx"; \
	done
	@echo "============================================"

# ============================================================
# Clean
# ============================================================
clean:
	@echo "🧹 Limpiando archivos generados..."
	rm -f *-final.html *.pdf *.pptx
	rm -f slides.html
	@echo "✅ Limpieza completada"

# ============================================================
# Help
# ============================================================
help:
	@echo ""
	@echo "🎨 Makefile — Generar PPTX/PDF con diferentes temas"
	@echo ""
	@echo "Temas disponibles: $(THEMES)"
	@echo ""
	@echo "Comandos:"
	@echo "  make build2026-pptx    # Genera build2026.pptx"
	@echo "  make azurebrains-pptx  # Genera azurebrains.pptx"
	@echo "  make all-pptx          # Genera todos los PPTX"
	@echo "  make build2026-pdf     # Genera build2026.pdf"
	@echo "  make azurebrains-pdf   # Genera azurebrains.pdf"
	@echo "  make all-pdf           # Genera todos los PDFs"
	@echo "  make all               # Genera todo (pptx + pdf)"
	@echo "  make extract-slides    # Extrae contenido de marp.html"
	@echo "  make combine           # Combina slides + tema → HTML"
	@echo "  make clean             # Limpia archivos generados"
	@echo "  make help              # Muestra esta ayuda"
	@echo ""
	@echo "Pipeline:"
	@echo "  slides.html + theme.css → marp-final.html → PDF → PPTX"
	@echo ""
