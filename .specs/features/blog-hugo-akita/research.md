# Research: Criar Blog Baseado no AkitaOnRails

**Data:** 03/06/2026
**Autor:** Nícolas (via Assistente)
**Tipo:** Nova Feature / Novo Projeto

---

## Contexto

O objetivo é criar um blog do zero no repositório atual, inspirando-se na arquitetura moderna do blog do Fabio Akita (AkitaOnRails). O blog original abandonou o Ruby on Rails em favor de uma arquitetura de Site Estático (SSG) extremamente rápida e de fácil manutenção, baseada em **Hugo** com o tema **Hextra** (um starter template muito popular para documentações e blogs).

Queremos replicar essa infraestrutura de alta performance aqui, gerando um site estático moderno, utilizando Markdown para o gerenciamento de conteúdo e preparando o terreno para publicação automatizada.

---

## Objetivos

- Inicializar um projeto de Site Estático usando Hugo.
- Instalar e configurar o tema Hextra (ou um fork similar), o mesmo utilizado no AkitaOnRails.
- Configurar a taxonomia, suporte a multi-idiomas (se necessário) e estrutura de assets (imagens, SCSS) adequados ao Hugo.
- Fornecer um script ou fluxo simples para criação e publicação de novos posts.

---

## Critérios de Aceite

- [ ] O projeto base do Hugo deve compilar com sucesso (`hugo serve`).
- [ ] O tema Hextra deve estar funcional e visível localmente.
- [ ] O repositório deve ser capaz de receber novos posts na pasta `content/` e renderizá-los corretamente.
- [ ] O ambiente deve suportar a compilação de assets via Hugo Extended (necessário para o Hextra).
- [ ] O projeto deve conter um `netlify.toml` (ou similar) pronto para deploy otimizado (com cache), nos moldes do projeto de inspiração.

---

## Tasks / Fixes

[Descoberto durante pesquisa]
1. Instalar o CLI do Hugo (versão Extended) no ambiente de desenvolvimento local (se ainda não existir).
2. Rodar `hugo new site . --force` para inicializar a estrutura na pasta atual.
3. Inicializar módulos do Go (`hugo mod init github.com/seu-usuario/blog`).
4. Importar o módulo do tema Hextra no arquivo de configuração (`hugo.toml`).
5. Criar um post de exemplo para testar a renderização (`hugo new content/posts/hello-world.md`).
6. Criar scripts utilitários similares aos do Akita (ex: `dev.sh`) para facilitar o `start` e criação de posts via Docker, caso seja o padrão desejado.
7. Escrever o `netlify.toml` para cache do repositório remoto.

---

## Arquivos Relevantes

(Como este é um projeto novo, estes são os arquivos **a serem criados** com base na pesquisa da arquitetura alvo):

### Backend / Infraestrutura / Configuração

| Arquivo | Status | Linhas-Chave | Relevância |
|---------|--------|--------------|------------|
| `hugo.toml` (ou `config.toml`) | NEW | TBD | Configuração principal do Hugo e importação do Hextra |
| `go.mod` | NEW | TBD | Gerenciador de módulos do Hugo (para temas) |
| `netlify.toml` | NEW | TBD | Configuração de deploy, build commands e cache plugins |

### Frontend / Conteúdo

| Arquivo | Status | Linhas-Chave | Relevância |
|---------|--------|--------------|------------|
| `content/_index.md` | NEW | TBD | Página inicial do blog |
| `content/posts/hello-world.md` | NEW | TBD | Primeiro post de validação |
| `layouts/...` | NEW | TBD | Arquivos opcionais para sobrescrever componentes específicos do Hextra |

---

## Padrões e Convenções Aplicáveis

- **Uso do Hugo Modules**: Para instalar temas, o ecossistema atual do Hugo recomenda fortemente usar Go Modules (`hugo mod init`) em vez de Git Submodules. O repositório original faz isso.
- **Page Bundles**: Organizar cada post em uma pasta própria (ex: `content/posts/2026/06/hello-world/index.md`) junto com suas imagens locais, para não poluir uma pasta global de assets.
- **Hugo Extended**: A compilação de SCSS nativa do tema exige a versão "Extended" do binário do Hugo.

---

## Riscos e Observações

- **Dependência do Go**: Para usar Hugo Modules, é necessário ter o Golang instalado localmente (ou no container Docker).
- O projeto atual (`blog`) está praticamente vazio, então não há riscos de quebra de compatibilidade (legacy concerns).
- O deploy precisará ignorar as pastas de build locais (ex: `public/`, `resources/_gen/`) através do `.gitignore`.

---

## Referências

- Repositório de Inspiração: [akitaonrails.github.io](https://github.com/akitaonrails/akitaonrails.github.io)
- Documentação do Tema Hextra: [hextra.im](https://hextra.im/)
- Skill de Planning: `.agents/skills/tlc-spec-driven`
