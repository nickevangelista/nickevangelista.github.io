# Nícolas Evangelista

Código do site [nickevangelista.github.io/blog](https://nickevangelista.github.io/blog/). Feito com [Hugo](https://gohugo.io/) e o tema [Hextra](https://imfing.github.io/hextra/).

## Como publicar

1. Escreve a nota no Obsidian.
2. Roda `publicar "caminho/da/Nota.md"`.

O script cria `content/posts/<slug>/index.md`, troca `[[links]]` por texto puro, copia as imagens de `![[...]]` pra pasta do post, testa o build e faz o commit. Antes do push ele pergunta. Cada push na `main` publica o site pelo GitHub Actions (`.github/workflows/hugo.yml`).

Pra escrever direto no repo, crie o `.md` em `content/posts/` com este cabeçalho:

```yaml
---
title: "Título"
date: 2026-11-03
draft: false
---
```

## Rodar local

```bash
mise install    # Hugo e Go nas versões do mise.toml
./run_hugo.sh   # http://localhost:1313/blog/, com rascunhos
```

## Estrutura

- `content/posts/`: os posts
- `content/sobre.md`: a página Sobre
- `layouts/`: home com os posts agrupados por mês e os favicons
- `scripts/publicar`: o fluxo Obsidian → site
