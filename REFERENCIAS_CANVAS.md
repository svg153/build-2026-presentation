# 🎨 Canvas Extensions en GitHub Copilot App

## 📖 Documentación Oficial
- **Docs:** https://docs.github.com/copilot/how-tos/github-copilot-app/working-with-canvas-extensions
- **Apm Repo:** https://github.com/microsoft/apm/blob/main/docs/src/content/docs/integrations/canvas.md
- **Awesome Copilot:** https://awesome-copilot.github.com/extensions

## 🔧 ¿Qué es un Canvas Extension?
- **Architectura:** Directorio bundle con `copilot-extension.json` + `extension.mjs` (Node.js executable)
- **Función:** Superficie interactiva compartida para artifacts de trabajo (planes, dashboards, kanbans, etc.)
- **Bidireccional:** El agente actualiza el canvas, el usuario edita en la misma superficie
- **Instalación:** `~/.copilot/extensions/<name>/`

## 🌟 Ejemplos de Canvas Extensions

### 1. Lee Reilly — Quake 30 ⭐
- **Tweet:** https://x.com/leereilly/status/2068952875775283235
- **Demo:** https://leereilly.net/quakelike/
- **Función:** Port de Quake a web+mobile construido en vivo con Canvas
- **Features:** Web+mobile, Copilot en consola, niveles procedurales, SoundCloud, GIF capture, CRT+ASCII

### 2. Burke Holland — Worktree Divergence
- **Tweet:** https://x.com/burkeholland/status/2064446521035067615
- **Gist:** https://gist.github.com/burkeholland/f9b912fde2130f2a468e7cddc8df0333
- **Función:** Visualiza git worktrees como diagrama de ramas interactivo vinculado a sessions
- **Stats:** 43.2K views

### 3. Coffilot — Java Console
- **Repo:** https://github.com/jdubois/coffilot
- **Función:** Convierte proyectos Maven/Gradle en consola interactiva en Canvas
- **Soporta:** Java/Spring Boot/Quarkus

## 🔌 Otras Extensions Destacadas
1. **AI-credit monitor** — @elbruno (gist)
2. **Agentic Kanban** — Whiteboard + Data Flow Visualizer
3. **Backlog Swipe Triage**
4. **Chromium Control Canvas** — Navegador Chromium interactivo
5. **Accessibility Kanban**
6. **Agent Arcade**
7. **Skills exercise template** — @arilivigni

## 📚 Recursos Adicionales
- **Install Guide:** https://github.com/xavierxmorris/copilot-app-canvas-install-guide (CLI extensions)
- **Field Notes:** https://github.com/titan-syndicate/copilot-extensions-field-notes (evaluations, setup guides)
- **Copilot SDK:** github.com/github/copilot-sdk (canvas/extension hooks)

## 💡 Por qué mola
Canvas convierte la Copilot App de un chat a un **workspace visual** — los agentes muestran su progreso, pensamiento y resultados en paneles interactivos que cualquiera puede extender con sus propias extensions.
