# 📚 Recursos Oficiales — BYOK (Bring Your Own Key)

## 📖 GitHub Changelog — BYOK Release

### Título
**GitHub Copilot app support for BYOK**

### Fecha
June 23, 2026 (1 minute read)

### Categoría
RELEASE — COPILOT

### URL
https://github.blog/changelog/2026-06-23-github-copilot-app-support-for-byok/

### Resumen
The GitHub Copilot app now supports bring your own key (BYOK), so you can run agent sessions against your own model providers, including OpenAI, Azure OpenAI, Microsoft Foundry, Anthropic, LM Studio, Ollama, and any OpenAI-compatible endpoint.

### Cómo funciona
- Add a provider in **Settings → Model Providers** with your endpoint and API key, or just a host for LM Studio or Ollama
- Once added, your provider's models appear in the model picker alongside Copilot-hosted models
- You choose which one to use each session
- Keys are stored in the local OS keychain and are never read back by the UI

### Con BYOK puedes:

1. **Connect the providers you already use**
   - Add Azure OpenAI, Anthropic, self-hosted Ollama, LM Studio, or any OpenAI-compatible gateway
   - Choose the right model for each session while keeping your existing billing, quotas, regions, and data-handling terms

2. **Mix frontier and local models**
   - Pair a frontier model with a local or self-hosted model
   - Frontier models handle complexity
   - Local models handle execution

3. **Keep traffic in your tenant**
   - Route inference through your own cloud account, tenant, or internal gateway
   - For enterprise and regulated environments with stricter data-boundary requirements

### Nota importante
To access the GitHub Copilot app on a Copilot Business or Enterprise plan, your organization or enterprise admin must have the Copilot CLI enabled in policy settings.

### Recursos relacionados
- [Getting started with the GitHub Copilot app](https://docs.github.com/en/copilot/github-copilot-app/getting-started)
- [Using your own LLM models (BYOK)](https://docs.github.com/en/copilot/github-copilot-app/using-your-own-llm-models)
- [GitHub Community discussion](https://github.community)

---

## 🔗 Changelog Relacionados (Jun 2026)

| Fecha | Título | Categoría |
|-------|--------|-----------|
| Jun 23 | **Copilot CLI: New terminal interface is generally available** | RELEASE |
| Jun 22 | New features and Claude as agent provider preview in JetBrains IDEs | IMPROVEMENT |
| Jun 19 | AI credits consumed per user now in the Copilot usage metrics API | RELEASE |
| Jun 18 | Upcoming deprecation of Opus 4.6 (fast) | RETIRED |
| Jun 18 | MAI-Code-1-Flash available on more Copilot surfaces | RELEASE |
| Jun 18 | Copilot code review: AGENTS.md support and UI improvements | IMPROVEMENT |
| Jun 18 | Copilot-authored pull requests now included in author searches | IMPROVEMENT |
| Jun 18 | Generated release notes credit you for Copilot pull requests | IMPROVEMENT |
| Jun 17 | Enterprise-managed settings now support bypass permission controls | IMPROVEMENT |
