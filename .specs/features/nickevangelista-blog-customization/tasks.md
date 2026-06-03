# Nickevangelista Blog Customization Tasks

**Design**: `.specs/features/nickevangelista-blog-customization/design.md`
**Status**: Complete

---

## Execution Plan

### Phase 1: Configuration Updates (Sequential)

Tasks to update parameters in `hugo.toml`.

```
T1 → T2
```

### Phase 2: Build & Validation (Sequential)

Validate that the site compiles and renders correctly.

```
T2 → T3
```

---

## Task Breakdown

### T1: Update Site Title

**What**: Update the site title configuration parameter.
**Where**: [hugo.toml](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/hugo.toml)
**Depends on**: None
**Reuses**: None
**Requirement**: BRAND-01

**Tools**:
- MCP: `filesystem`
- Skill: NONE

**Done when**:
- [x] The `title` parameter in `hugo.toml` is modified to `"nickevangelista's blog"`.
- [x] String syntax uses double quotes to safely handle the apostrophe.

**Tests**: none
**Gate**: build

---

### T2: Add GitHub Menu Link

**What**: Configure the main header menu with a link and icon for GitHub.
**Where**: [hugo.toml](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/hugo.toml)
**Depends on**: T1
**Reuses**: None
**Requirement**: BRAND-02, BRAND-03

**Tools**:
- MCP: `filesystem`
- Skill: NONE

**Done when**:
- [x] A `[[menu.main]]` entry is added to `hugo.toml` pointing to `https://github.com/nickevangelista`.
- [x] The menu entry uses `params = { icon = "github" }` (or inline table equivalent) for Hextra icon styling.
- [x] The menu has a name or identifier if required for layout structure.

**Tests**: none
**Gate**: build

---

### T3: Validate Build and Render

**What**: Execute Hugo build and inspect built contents to verify title and menu link.
**Where**: Repository root (via shell command)
**Depends on**: T2
**Reuses**: [run_hugo.sh](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/run_hugo.sh)
**Requirement**: BUILD-01

**Tools**:
- MCP: `filesystem`
- Command: `bash run_hugo.sh`

**Done when**:
- [x] `run_hugo.sh` executes and exits with a code of `0` without compilation warnings or errors.
- [x] The built homepage (`public/index.html`) contains the correct document title `<title>nickevangelista's blog</title>` (or contains the new title branding).
- [x] The built homepage contains the link to `https://github.com/nickevangelista` with the correct SVG icon marker.

**Tests**: none
**Gate**: build

---

## Parallel Execution Map

```
Phase 1 (Sequential Configuration):
  T1 ──→ T2

Phase 2 (Sequential Validation):
  T2 ──→ T3
```

**Parallelism constraint:** None of the tasks are marked `[P]` as they are sequential and modify the same configuration file.

---

## Task Granularity Check

| Task | Scope | Status |
| --- | --- | --- |
| T1: Update Site Title | 1 parameter modification | ✅ Granular |
| T2: Add GitHub Menu Link | 1 block insertion | ✅ Granular |
| T3: Validate Build and Render | 1 script execution and checks | ✅ Granular |

---

## Diagram-Definition Cross-Check

| Task | Depends On (task body) | Diagram Shows | Status |
| --- | --- | --- | --- |
| T1 | None | Start ──→ T1 | ✅ Match |
| T2 | T1 | T1 ──→ T2 | ✅ Match |
| T3 | T2 | T2 ──→ T3 | ✅ Match |

---

## Test Co-location Validation

Since the repository does not have automated tests, verification is done through build validation and manual check.

| Task | Code Layer Created/Modified | Matrix Requires | Task Says | Status |
| --- | --- | --- | --- | --- |
| T1 | config | none | none | ✅ OK |
| T2 | config | none | none | ✅ OK |
| T3 | validation | none | none | ✅ OK |
