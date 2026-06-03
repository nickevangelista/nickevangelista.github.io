# Research: Customização de Branding e Botão do GitHub

**Data:** 03/06/2026
**Autor:** Nícolas Evangelista (via Assistente)
**Tipo:** Nova Feature / Customização

---

## Contexto

O blog está estruturado em cima do gerador de sites estáticos **Hugo** utilizando o tema **Hextra** (carregado via Go Modules). O usuário deseja realizar customizações de marca e navegação para refletir seu perfil pessoal, alterando o nome do site para **nickevangelista's blog** e inserindo um botão do GitHub que redireciona para o seu perfil pessoal `https://github.com/nickevangelista`.

A referência de design e comportamento solicitada é o blog do Fabio Akita (AkitaOnRails), que possui uma barra de navegação superior com links sociais e ícones discretos (incluindo o logo do GitHub), além de suporte para pesquisa local e navegação fluida de posts Markdown.

---

## Objetivos

- Atualizar o título do site para **nickevangelista's blog**.
- Adicionar um link/botão social do GitHub direcionando para `https://github.com/nickevangelista` na barra de navegação principal (menu superior), utilizando o ícone de marca do GitHub.
- Garantir que a compilação do Hugo ocorra sem erros após a alteração da configuração do tema.

---

## Critérios de Aceite

- [ ] O título do site no cabeçalho ou metadados deve ser exatamente **nickevangelista's blog**.
- [ ] Deve existir um botão/link na barra de navegação superior direcionando para `https://github.com/nickevangelista`.
- [ ] O link do GitHub no cabeçalho deve exibir o ícone padrão do GitHub fornecido pelo tema Hextra.
- [ ] A execução do comando de compilação do Hugo (`./hugo` ou `hugo`) deve completar com sucesso, sem erros de sintaxe TOML ou de resolução de menus.

---

## Tasks / Fixes

[Descoberto durante pesquisa]
1. Alterar o parâmetro `title` no arquivo `hugo.toml` para `"nickevangelista's blog"`.
2. Adicionar o bloco de menu principal (`[menu]`) no `hugo.toml` para registrar o link do GitHub com o parâmetro `icon = "github"`.
3. Executar o build do Hugo localmente (`wsl bash run_hugo.sh`) para validar se a compilação ocorre normalmente.

---

## Arquivos Relevantes

### Infraestrutura / Configuração

| Arquivo | Status | Linhas-Chave | Relevância |
|---------|--------|--------------|------------|
| `hugo.toml` | MODIFIED | L3: Title, L5-L8: Module imports | Onde residem o título do site, importação do tema Hextra e as configurações de menus da barra de navegação superior. |

### Conteúdo

| Arquivo | Status | Linhas-Chave | Relevância |
|---------|--------|--------------|------------|
| `content/_index.md` | EXISTING | L1-L6 | Página inicial do site, serve para validar o carregamento visual do tema e barra de navegação modificada. |

---

## Padrões e Convenções Aplicáveis

- **Configuração via `hugo.toml`**: As modificações de menus e parâmetros do tema devem seguir a sintaxe TOML suportada pelo Hugo e o tema Hextra.
- **Configuração de ícones no Hextra**: No tema Hextra, itens de menu no topo (`menu.main`) aceitam parâmetros adicionais para ícones em SVG, usando `params.icon = "github"`.

---

## Riscos e Observações

- **Sintaxe do TOML**: Erros de formatação em TOML (como falta de aspas simples/duplas em strings com apóstrofos ou indentação incorreta de blocs de array `[[menu.main]]`) podem impedir a compilação. O título `nickevangelista's blog` contém um apóstrofo e deve ser envolto em aspas duplas: `"nickevangelista's blog"`.

---

## Referências

- Repositório de Inspiração: [akitaonrails.github.io](https://github.com/akitaonrails/akitaonrails.github.io)
- Perfil do Usuário no GitHub: [github.com/nickevangelista](https://github.com/nickevangelista)
- Configuração de Menus do Hextra: [hextra.im](https://hextra.im/)
