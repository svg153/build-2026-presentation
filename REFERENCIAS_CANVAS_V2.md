# 🎨 Canvas Extensions en GitHub Copilot App

## 📖 Documentación Oficial
- **Docs:** https://docs.github.com/copilot/how-tos/github-copilot-app/working-with-canvas-extensions
- **Apm Repo:** https://github.com/microsoft/apm/blob/main/docs/src/content/docs/integrations/canvas.md

## 🔧 ¿Qué es un Canvas Extension?
- Directorio bundle con entry file `extension.mjs` (Node.js executable)
- Superficie interactiva compartida para artifacts de trabajo
- Bidireccional: el agente actualiza el canvas, el usuario edita en la misma superficie
- Se instala en `~/.copilot/extensions/<name>/`

## 🌟 Ejemplos de Canvas Extensions

### 1. Burke Holland — Session Browser
- **Gist:** https://gist.github.com/burkeholland/f9b912fde2130f2a468e7cddc8df0333
- **Tweet:** https://x.com/burkeholland/status/2064446521035067615
- **Función:** Visualiza git worktrees como diagrama de ramas interactivo vinculado a sessions
- **Archivos:** copilot-extension.json + extension.mjs

### 2. Coffilot — Java Extension
- **Repo:** https://github.com/jdubois/coffilot
- **Función:** Convierte proyectos Maven/Gradle en consola interactiva en Canvas
- Soporta Java/Spring Boot/Quarkus

### 3. Lee Reilly — Quake 30
- **Tweet:** https://x.com/leereilly/status/2068952875775283235
- **Demo:** https://leereilly.net/quakelike/
- **Función:** Port de Quake a web+mobile con canvas

## 📚 Awesome Copilot
- **Lista:** https://awesome-copilot.github.com/extensions
- **Repositorio:** github.com/awesome-copilot/awesome-copilot
- Canvas listados como "Interactive canvas extensions for Copilot app experiences"

## 🔌 Canvas Extensions Destacadas
1. Accessibility Kanban
2. Agent Arcade
3. Backlog Swipe Triage
4. Chromium Control Canvas
5. Worktree Divergence (Burke Holland)
