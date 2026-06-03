# Search and Grouping Specification

## Problem Statement

To enhance the user experience of the blog, we need to implement features inspired by Fabio Akita's blog. This includes an offline-capable, local search bar in the header menu, grouping the posts on the homepage chronologically by year and month (in Portuguese), generating a Table of Contents (TOC) sidebar on the home page for quick navigation to these groups, and setting up a custom brand favicon. Additionally, the generic Hugo repository README needs to be replaced with custom, relevant documentation.

## Goals

- [ ] Enable local search (FlexSearch) via the main navigation bar.
- [ ] Localize the site configuration to Portuguese (`pt-br`/`pt`).
- [ ] Customize the home page layout to group posts by year and month (in Portuguese).
- [ ] Implement a dynamic Table of Contents (TOC) sidebar on the homepage to jump to grouped month headers.
- [ ] Integrate a custom brand favicon ("N" logo) for all devices and pages.
- [ ] Document the project setup, structure, and development instructions in `README.md`.

## Out of Scope

| Feature     | Reason         |
| ----------- | -------------- |
| External Search Engine Integration | Hextra's built-in local search (FlexSearch) is sufficient and requested. |
| Custom styling for search | Default theme styling is clean and matches the design language. |
| Pagination of grouped posts | Grouping all posts chronologically on a single index page matches the reference design. |

---

## User Stories

### P1: Search and Localization ⭐ MVP

**User Story**: As a reader, I want to search for posts by title and content offline, and see dates formatted in my local language (Portuguese) so that I can easily navigate the content.

**Why P1**: Core features requested by the user to activate built-in theme capabilities.

**Acceptance Criteria**:
1. WHEN the home page or any page is loaded, THEN the top-right navigation menu SHALL display a search input box.
2. WHEN the user types in the search input box, THEN local search results (titles/content) SHALL be computed offline using Hextra's FlexSearch and displayed.
3. WHEN the site Hugo configuration is set, THEN dates SHALL render using the Portuguese locale.

**Independent Test**:
- Run `wsl bash run_hugo.sh` and verify successful compilation.
- Open the built site, verify the search input exists in the header, type "Hello", and see the results list appear.

---

### P1: Chronological Homepage Grouping & TOC ⭐ MVP

**User Story**: As a reader, I want the homepage to group articles by Year and Month (e.g., "2026 - Junho") and have a sidebar menu that links directly to each group, so that I can browse posts by date and navigate easily.

**Why P1**: Replicates the signature AkitaOnRails blog chronological structure and navigation.

**Acceptance Criteria**:
1. WHEN the homepage is rendered, THEN all posts from the `/posts` section SHALL be listed grouped by Year and Month.
2. WHEN a group header is displayed, THEN the header text SHALL be formatted as "YYYY - MonthName" in Portuguese (e.g., "2026 - Junho").
3. WHEN the homepage is loaded, THEN a sidebar Table of Contents SHALL render anchors referencing each group header.
4. WHEN clicking a sidebar TOC anchor, THEN the viewport SHALL scroll to the corresponding group header.

**Independent Test**:
- Open the built homepage.
- Verify that the post "Hello World" (dated June 2026) appears under the header "2026 - Junho".
- Verify that the TOC menu on the right shows "2026 - Junho" and clicking it scrolls/anchors to that header.

---

### P1: Custom Favicon Integration ⭐ MVP

**User Story**: As a reader, I want to see a custom "N" favicon in my browser tab, so that the blog feels branded and professional.

**Why P1**: Custom branding requirement to replace default theme/browser placeholders.

**Acceptance Criteria**:
1. WHEN any page of the blog is opened in the browser, THEN the browser tab SHALL display the custom "N" brand icon.
2. WHEN inspecting the page source, THEN the favicon links SHALL point to the custom `favicon.png`.

**Independent Test**:
- Check the built `public/favicon.png` file and verify it matches the custom logo image.
- Verify `public/index.html` has links pointing to `favicon.png` in its head.

---

### P2: Custom Repository README

**User Story**: As a developer, I want a clean, specific project README, so that I can understand how this blog is built, its structure, and how to run it.

**Why P2**: Quality of life and documentation completeness to remove placeholder templates.

**Acceptance Criteria**:
1. WHEN checking `README.md`, THEN it SHALL describe `nickevangelista's blog`, its tech stack (Hugo, Hextra), directory structure, and local run/build commands.

---

## Edge Cases

- WHEN a month name is translated, THEN it must handle lowercase or uppercase translations properly according to Portuguese grammatical conventions or site styling (e.g., "Junho").
- WHEN generating anchor IDs, THEN the anchor strings MUST be URL-safe (urlized) and match exactly between the TOC sidebar and the `h2` header tags to prevent broken links.

---

## Requirement Traceability

| Requirement ID | Story                                         | Phase   | Status  |
| -------------- | --------------------------------------------- | ------- | ------- |
| SRCH-01        | P1: Search and Localization                   | Specify | Pending |
| LOC-01         | P1: Search and Localization                   | Specify | Pending |
| GRP-01         | P1: Chronological Homepage Grouping & TOC     | Specify | Pending |
| TOC-01         | P1: Chronological Homepage Grouping & TOC     | Specify | Pending |
| FAV-01         | P1: Custom Favicon Integration                | Specify | Pending |
| FAV-02         | P1: Custom Favicon Integration                | Specify | Pending |
| DOC-01         | P2: Custom Repository README                  | Specify | Pending |
| BUILD-01       | P1: Search and Localization                   | Specify | Pending |

**Coverage:** 8 total, 0 mapped to tasks, 8 unmapped ⚠️

---

## Success Criteria

- [ ] Hugo compilations via `run_hugo.sh` run successfully with zero errors.
- [ ] Search input functions offline showing search results for existing posts.
- [ ] Homepage groups posts by Year and Month in Portuguese.
- [ ] Right-side Table of Contents correctly navigates to the date headers.
- [ ] Custom "N" favicon displays correctly.
- [ ] README.md contains customized blog documentation.
