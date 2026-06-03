# Blog Hugo (AkitaOnRails Style) Specification

## Problem Statement

O repositório atual precisa de um blog de alta performance e fácil manutenção. Inspirado na arquitetura moderna do AkitaOnRails, o objetivo é abandonar frameworks complexos em favor de um Site Estático (SSG) construído com Hugo e o tema Hextra, otimizando o fluxo de autoria em Markdown e a publicação.

## Goals

- [ ] Inicializar o projeto base do Hugo e compilar com sucesso localmente.
- [ ] Instalar e configurar o tema Hextra (via Go Modules) e ter o design renderizado.
- [ ] Configurar a criação de novos posts (page bundles) e a estrutura de assets (SCSS, imagens).
- [ ] Criar arquivo de configuração de deploy (`netlify.toml`) para cache otimizado.

## Out of Scope

Explicitly excluded. Documented to prevent scope creep.

| Feature | Reason |
|---------|--------|
| Migração de conteúdo legado | Projeto está sendo criado do zero no repositório atual, sem conteúdo prévio para migrar. |
| Customização pesada do Hextra | Queremos usar a estrutura padrão e overrides simples para garantir facilidade de atualização e manutenção futura. |
| Integração com CMS Headless | O gerenciamento de conteúdo será feito exclusivamente via arquivos Markdown (Git-based). |

---

## User Stories

### P1: Configuração Inicial e Tema ⭐ MVP

**User Story**: As a Desenvolvedor, I want inicializar um site estático Hugo com o tema Hextra so that eu tenha um ambiente de blog moderno rodando localmente.

**Why P1**: É a base fundacional do projeto; sem o site configurado e o tema carregado, não há blog.

**Acceptance Criteria**:

1. WHEN o desenvolvedor roda `hugo serve` THEN system SHALL compilar o site sem erros.
2. WHEN o usuário acessa `localhost:1313` THEN system SHALL exibir a página inicial utilizando o tema Hextra.
3. WHEN o projeto é inicializado THEN system SHALL usar Go Modules para gerenciar o tema Hextra (`go.mod`).

**Independent Test**: Rodar `hugo serve` e acessar a página inicial no navegador para confirmar que o tema Hextra carregou corretamente com as configurações base do `hugo.toml`.

---

### P1: Fluxo de Criação de Conteúdo ⭐ MVP

**User Story**: As a Autor, I want poder criar novos posts em formato Markdown com facilidade so that eu possa focar na escrita sem me preocupar com infraestrutura.

**Why P1**: A criação de conteúdo é a principal função de um blog.

**Acceptance Criteria**:

1. WHEN o autor criar um arquivo em `content/posts/hello-world.md` THEN system SHALL renderizar o post corretamente.
2. WHEN o autor criar um post no formato Page Bundle (pasta com `index.md` e imagens na mesma pasta) THEN system SHALL exibir o post e as imagens associadas perfeitamente.

**Independent Test**: Usar `hugo new` para criar um post de teste, adicionar algum conteúdo textual e imagens, rodar o servidor e verificar se o post está acessível na listagem de posts e formatado corretamente.

---

### P2: Configuração de Deploy e Cache

**User Story**: As a Administrador, I want ter o `netlify.toml` configurado so that o deploy na Netlify seja rápido e automatizado utilizando cache otimizado.

**Why P2**: Necessário para colocar o site em produção com eficiência e performance, sendo um diferencial da infraestrutura baseada no Akita.

**Acceptance Criteria**:

1. WHEN um push for feito para o repositório remoto THEN system SHALL acionar o build da Netlify usando as configurações e comandos do `netlify.toml`.
2. WHEN o build da Netlify rodar THEN system SHALL utilizar cache de módulos Go e recursos gerados (`resources/_gen`) para acelerar o deploy.

**Independent Test**: Revisar o arquivo `netlify.toml` garantindo que os comandos de build (ex: `hugo --gc --minify`) e caminhos de cache estejam explicitamente definidos de acordo com as melhores práticas para Hugo.

---

## Edge Cases

- WHEN um post é criado sem um título definido no frontmatter THEN system SHALL usar o nome do arquivo ou exibir um fallback, sem quebrar o build.
- WHEN a compilação do SCSS for acionada sem o Hugo Extended THEN system SHALL falhar o build com um erro claro ou log informativo pedindo a versão apropriada.

---

## Requirement Traceability

Each requirement gets a unique ID for tracking across design, tasks, and validation.

| Requirement ID | Story | Phase | Status |
|----------------|-------|-------|--------|
| BLOG-01 | P1: Configuração Inicial e Tema | Tasks | Pending |
| BLOG-02 | P1: Fluxo de Criação de Conteúdo | Tasks | Pending |
| BLOG-03 | P2: Configuração de Deploy e Cache | Tasks | Pending |

**ID format:** `[CATEGORY]-[NUMBER]`

**Status values:** Pending → In Design → In Tasks → Implementing → Verified

**Coverage:** 3 total, 0 mapped to tasks, 3 unmapped ⚠️

---

## Success Criteria

How we know the feature is successful:

- [ ] O comando `hugo serve` roda sem erros e renderiza a estrutura base do blog localmente.
- [ ] É possível adicionar um novo post e visualizar tanto na listagem quanto na página individual.
- [ ] Existe o arquivo `netlify.toml` pronto para ser utilizado na plataforma de deploy com build command e caches configurados.
