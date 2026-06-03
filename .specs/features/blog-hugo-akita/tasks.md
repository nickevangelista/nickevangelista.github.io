# Blog Hugo (AkitaOnRails Style) Tasks

**Design**: `.specs/features/blog-hugo-akita/design.md`
**Status**: Draft

---

## Execution Plan

### Phase 1: Foundation (Sequential)
Tasks that must be done first, in order.

```
T1 → T2
```

### Phase 2: Content & Infrastructure (Parallel OK)
After foundation, these can run in parallel.

```
     ┌→ T3 [P]
T2 ──┤
     └→ T4 [P]
```

---

## Task Breakdown

### T1: Initialize Base Config & Theme

**What**: Inicializar módulo Go e configurar importação do tema Hextra no Hugo.
**Where**: `go.mod` e `hugo.toml`
**Depends on**: None
**Reuses**: N/A
**Requirement**: BLOG-01

**Tools**:
- MCP: `filesystem`, `terminal`
- Skill: NONE

**Done when**:
- [x] Arquivo `go.mod` criado (ex: usando `hugo mod init github.com/user/blog`).
- [x] Arquivo `hugo.toml` criado configurando baseURL e a importação do Hextra (`github.com/imfing/hextra`).
- [x] Gate check passes: executar `hugo config` não retorna erros.
- [x] Test count: 0 tests pass (no silent deletions)

**Tests**: none
**Gate**: quick

---

### T2: Create Homepage

**What**: Criar a página inicial básica do blog para renderizar o tema Hextra.
**Where**: `content/_index.md`
**Depends on**: T1
**Reuses**: N/A
**Requirement**: BLOG-01

**Tools**:
- MCP: `filesystem`
- Skill: NONE

**Done when**:
- [x] Arquivo `_index.md` criado com título no frontmatter.
- [x] Gate check passes: executar `hugo` (build) cria o site com sucesso em `/public`.
- [x] Test count: 0 tests pass (no silent deletions)

**Tests**: none
**Gate**: build

---

### T3: Create Example Post [P]

**What**: Criar um post de exemplo para validar o fluxo de conteúdo e renderização.
**Where**: `content/posts/hello-world.md`
**Depends on**: T2
**Reuses**: N/A
**Requirement**: BLOG-02

**Tools**:
- MCP: `filesystem`, `terminal`
- Skill: NONE

**Done when**:
- [x] Arquivo markdown criado corretamente.
- [x] Post contém YAML frontmatter (title, date, draft).
- [x] Gate check passes: executar `hugo` inclui o post no sumário do build (ex: "Regular pages created: 1").
- [x] Test count: 0 tests pass (no silent deletions)

**Tests**: none
**Gate**: build

---

### T4: Setup Netlify Deploy [P]

**What**: Criar configuração de build e cache para a plataforma Netlify.
**Where**: `netlify.toml`
**Depends on**: T2
**Reuses**: N/A
**Requirement**: BLOG-03

**Tools**:
- MCP: `filesystem`
- Skill: NONE

**Done when**:
- [x] Arquivo `netlify.toml` gerado com bloco `[build]`.
- [x] Comando de publicação definido como `hugo --gc --minify`.
- [x] Diretório de publicação definido como `public`.
- [x] Gate check passes: arquivo tem sintaxe TOML válida.
- [x] Test count: 0 tests pass (no silent deletions)

**Tests**: none
**Gate**: quick

---

## Parallel Execution Map

Visual representation of what can run simultaneously:

```
Phase 1 (Sequential):
  T1 ──→ T2

Phase 2 (Parallel):
  T2 complete, then:
    ├── T3 [P]
    └── T4 [P]  } Can run simultaneously
```

---

## Task Granularity Check

| Task | Scope | Status |
|------|-------|--------|
| T1: Initialize Base Config & Theme | Configuração de projeto e módulos | ✅ Granular |
| T2: Create Homepage | 1 Arquivo Markdown base | ✅ Granular |
| T3: Create Example Post | 1 Arquivo Markdown post | ✅ Granular |
| T4: Setup Netlify Deploy | 1 Arquivo TOML de deploy | ✅ Granular |

---

## Diagram-Definition Cross-Check

| Task | Depends On (task body) | Diagram Shows | Status |
|------|------------------------|---------------|--------|
| T1 | None | N/A (Start) | ✅ Match |
| T2 | T1 | T1 → T2 | ✅ Match |
| T3 | T2 | T2 → T3 | ✅ Match |
| T4 | T2 | T2 → T4 | ✅ Match |

---

## Test Co-location Validation

*Nota: Não há matriz `TESTING.md` configurada pois trata-se de um site estático gerado, com verificação de compilação em vez de testes unitários ou e2e.*

| Task | Code Layer Created/Modified | Matrix Requires | Task Says | Status |
|------|-----------------------------|-----------------|-----------|--------|
| T1 | Infraestrutura Hugo (Configs) | none | none | ✅ OK |
| T2 | Conteúdo Estático (Index) | none | none | ✅ OK |
| T3 | Conteúdo Estático (Post) | none | none | ✅ OK |
| T4 | Infraestrutura Deploy | none | none | ✅ OK |
