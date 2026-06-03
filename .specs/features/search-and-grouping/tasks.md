# Search and Grouping Tasks

**Design**: `.specs/features/search-and-grouping/design.md`
**Status**: Draft

---

## Execution Plan

### Phase 1: Setup & Configuration (Parallel OK)

Initial setup of configuration settings, asset copy, and documentation updates.

```
T1 [P] ──→
T2 [P] ──→
T5 [P] ──→
```

### Phase 2: Overrides & Layouts (Parallel OK)

Custom layout and template generation.

```
T1 ──→ T4 [P]
T2 ──→ T3 [P]
```

### Phase 3: Validation (Sequential)

Build verification and functionality checks.

```
T3 ──┐
T4 ──┼─→ T6
T5 ──┘
```

---

## Task Breakdown

### T1: Configure Localization & Search Menu

**What**: Add date language code settings and main search menu item.
**Where**: [hugo.toml](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/hugo.toml)
**Depends on**: None
**Reuses**: None
**Requirement**: SRCH-01, LOC-01

**Tools**:
- MCP: `filesystem`

**Done when**:
- [x] `languageCode` set to `'pt-br'` in `hugo.toml`.
- [x] `defaultContentLanguage` set to `'pt'` in `hugo.toml`.
- [x] `[[menu.main]]` entry added with `name = "Search"` (or similar), `url = "/search/"` or empty, and `params = { type = "search" }`.

**Tests**: none
**Gate**: build

---

### T2: Copy Custom Favicon Asset

**What**: Copy the custom favicon PNG to the static files folder.
**Where**: [static/favicon.png](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/static/favicon.png)
**Depends on**: None
**Reuses**: None
**Requirement**: FAV-01

**Tools**:
- MCP: `filesystem`
- Command: `cp "C:/Users/nicol/.gemini/antigravity/brain/1173eb61-fa4b-49f0-a63b-37359d325954/favicon.png" static/favicon.png` (or copy from Downloads)

**Done when**:
- [x] File `static/favicon.png` exists in the workspace.
- [x] File size is non-zero.

**Tests**: none
**Gate**: build

---

### T3: Create Favicon Layout Override

**What**: Create layout partial to force load the custom favicon png.
**Where**: [layouts/partials/favicons.html](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/layouts/partials/favicons.html)
**Depends on**: T2
**Reuses**: Theme `favicons.html`
**Requirement**: FAV-02

**Tools**:
- MCP: `filesystem`

**Done when**:
- [x] Layout file `layouts/partials/favicons.html` created.
- [x] All icon references point to `/favicon.png`.

**Tests**: none
**Gate**: build

---

### T4: Create Homepage Custom Layout

**What**: Override home page layout to group posts and render custom TOC matching Hextra's grid/TOC layout.
**Where**: [layouts/index.html](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/layouts/index.html)
**Depends on**: T1
**Reuses**: Theme `layouts/home.html` and `layouts/_partials/toc.html` markup structures
**Requirement**: GRP-01, TOC-01

**Tools**:
- MCP: `filesystem`

**Done when**:
- [x] File `layouts/index.html` created with custom `define "main"` block.
- [x] Post list dynamically queries `site.RegularPages` under Section `"posts"`.
- [x] Grouping logic uses `.GroupByDate "2006-01"`.
- [x] Header date outputs month names in Portuguese (using `time.Format`).
- [x] Header elements use unique and URL-safe IDs matching TOC anchors.
- [x] Sidebar TOC matches Hextra styling and renders links dynamically iterating over the same groups.

**Tests**: none
**Gate**: build

---

### T5: Refactor Repository README.md

**What**: Replace default template README with specific details for nickevangelista's blog.
**Where**: [README.md](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/README.md)
**Depends on**: None
**Reuses**: None
**Requirement**: DOC-01

**Done when**:
- [x] File `README.md` contents updated.
- [x] Describes site name "nickevangelista's blog", Tech stack (Hugo + Hextra), project structure, and local commands.

**Tests**: none
**Gate**: build

---

### T6: Validate Build & Functionality

**What**: Compile the project and verify correct rendering of all features in outputs.
**Where**: Repository root (via shell command)
**Depends on**: T3, T4, T5
**Reuses**: [run_hugo.sh](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/run_hugo.sh)
**Requirement**: BUILD-01

**Tools**:
- Command: `wsl bash run_hugo.sh`

**Done when**:
- [x] Compilation executes successfully with exit code 0.
- [x] Homepage `public/index.html` contains the custom sidebar TOC containing month anchors.
- [x] Homepage `public/index.html` contains the chronological posts list with PT dates (e.g. "2026 - Junho").
- [x] Homepage `public/index.html` has favicon references pointing to `favicon.png`.
- [x] Output includes the search script files `public/en.search.js` or `public/pt.search.js` depending on localization settings.

**Tests**: none
**Gate**: build

---

## Parallel Execution Map

```
Phase 1 (Parallel Setup):
  ├── T1 [P] (Config updates)
  ├── T2 [P] (Favicon copy)
  └── T5 [P] (README updates)

Phase 2 (Parallel Layouts):
  ├── T3 [P] (Favicon override - needs T2 complete)
  └── T4 [P] (Homepage layout - needs T1 complete)

Phase 3 (Sequential Validation):
  T3, T4, T5 complete, then:
    T6 (Compile & inspect outputs)
```

---

## Task Granularity Check

| Task | Scope | Status |
| ---- | ----- | ------ |
| T1: Configure Localization & Search Menu | Update single config file | ✅ Granular |
| T2: Copy Custom Favicon Asset | Single asset copying | ✅ Granular |
| T3: Create Favicon Layout Override | Single partial layout | ✅ Granular |
| T4: Create Homepage Custom Layout | Single layout template file | ✅ Granular |
| T5: Refactor Repository README.md | Documentation rewrite | ✅ Granular |
| T6: Validate Build & Functionality | Local build validation and verification checks | ✅ Granular |

---

## Diagram-Definition Cross-Check

| Task | Depends On (task body) | Diagram Shows | Status |
| ---- | ---------------------- | ------------- | ------ |
| T1 | None | Start ──→ T1 | ✅ Match |
| T2 | None | Start ──→ T2 | ✅ Match |
| T3 | T2 | T2 ──→ T3 | ✅ Match |
| T4 | T1 | T1 ──→ T4 | ✅ Match |
| T5 | None | Start ──→ T5 | ✅ Match |
| T6 | T3, T4, T5 | T3, T4, T5 ──→ T6 | ✅ Match |

---

## Test Co-location Validation

Since this is a static site project generated by Hugo and has no testing frameworks (like Jest or Pytest) configured, all tasks use build gates (`Gate: build`) and manual checks on compilation output.

| Task | Code Layer Created/Modified | Matrix Requires | Task Says | Status |
| ---- | --------------------------- | --------------- | --------- | ------ |
| T1 | configuration | none | none | ✅ OK |
| T2 | static assets | none | none | ✅ OK |
| T3 | layouts / templates | none | none | ✅ OK |
| T4 | layouts / templates | none | none | ✅ OK |
| T5 | documentation | none | none | ✅ OK |
| T6 | build validation | none | none | ✅ OK |
