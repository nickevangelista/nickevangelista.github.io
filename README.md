# Nícolas Evangelista

Source for [nickevangelista.github.io](https://nickevangelista.github.io/), the personal site of Nícolas Evangelista.

## What this site is

A small, serious publication under my own name. It is a place for essays and notes, not a diary. The model is the analyst's site: a short bio, a clear line of work, and writing that still holds up years later.

It publishes three kinds of pieces:

- **Technical notes:** things I built, bugs I fixed, numbers I measured. Short when the subject is short.
- **Reading notes:** what I took from a book or paper, and where I got stuck. Framed as a reader's notes, never as expertise.
- **Essays:** longer pieces when a subject needs the room.

## Editorial rules

1. Every piece has to pass one test: will it still be factual, respectable, and worth reading in five years?
2. Nothing about an employer's internals. Lessons, patterns, and reproducible numbers only.
3. No attacks on named people, and nothing written in anger.
4. Lead with the conclusion, then the context, then the analysis.
5. English by default.
6. The site is the canonical home. Newsletters or other platforms can mirror it later, never replace it.

## Writing and publishing

Drafts live in Obsidian. To publish one:

```bash
publicar "path/to/Note.md"
```

The script creates `content/notes/<slug>/index.md`, turns `[[links]]` into plain text, copies images from `![[...]]` next to the note (resized to 1600 px, with GPS and other metadata stripped), checks the build, commits, and asks before pushing. Every push to `main` deploys the site through GitHub Actions (`.github/workflows/hugo.yml`).

To see a note on the real site while you write it:

```bash
publicar --preview "path/to/Note.md"
```

It opens the post on a local copy of the site (http://localhost:1313/) as a draft and re-converts it every time the note is saved, so the page reloads on its own. Nothing is written to the repo; Ctrl+C stops it.

To write directly in the repo, create `content/notes/<slug>.md` with:

```yaml
---
title: "Title"
date: 2026-11-03
description: "One or two sentences shown on the home page."
draft: false
---
```

## Running locally

```bash
mise install    # Hugo and Go at the versions in mise.toml
./run_hugo.sh   # http://localhost:1313/, drafts included
```

## Design

Built with [Hugo](https://gohugo.io/) and the [Hextra](https://imfing.github.io/hextra/) theme, restyled to read like a publication rather than documentation:

- [Nord](https://www.nordtheme.com/) palette in both light and dark mode (`assets/css/custom.css`)
- Source Serif 4 for reading, Inter for the interface
- Home page with bio and latest writing (`layouts/home.html`), and an archive by year (`layouts/blog/list.html`)

## Layout

- `content/notes/`: everything published
- `content/about.md`: the About page
- `scripts/publicar`: the Obsidian-to-site workflow
