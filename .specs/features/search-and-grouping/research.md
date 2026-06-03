# Research: Search and Date Grouping

**Data:** 03/06/2026  
**Autor:** Nícolas Evangelista (via Assistente)  
**Tipo:** Nova Feature  

---

## Contexto

Atualmente, o blog utiliza o gerador de site estático **Hugo** com o tema **Hextra**. Após as customizações básicas de branding e inserção do link do GitHub no cabeçalho, o usuário deseja adicionar duas novas funcionalidades inspiradas no blog do Fabio Akita (AkitaOnRails):
1. **Campo de Busca por Título:** Um input de busca local posicionado no cabeçalho superior que filtre os posts de forma rápida e offline.
2. **Exibição de Posts Agrupados na Home:** A tela inicial do blog deve listar todos os posts publicados, agrupados cronologicamente por Ano - Mês em português (ex: "2026 - Junho", "2026 - Maio"), no estilo do blog de referência. Os cabeçalhos de cada mês/ano devem refletir na barra lateral direita de Table of Contents (TOC) para navegação fluida.
3. **Favicon Personalizado:** Inclusão de um favicon personalizado representado pelo logo de letra "N" fornecido pelo usuário.

---

## Objetivos

- Habilitar o campo de busca nativo do tema Hextra no canto superior direito da barra de navegação.
- Criar um layout personalizado para a página inicial (`index.html`) que liste posts agrupados de forma decrescente por Ano e Mês por extenso em português.
- Garantir que a barra lateral de Table of Contents (TOC) na home funcione com âncoras para os cabeçalhos de data agrupados.
- Configurar o site para usar o favicon "N" na barra do navegador em todos os dispositivos e páginas.
- Refatorar o `README.md` para remover as informações genéricas do Hugo e documentar os detalhes específicos deste blog (tecnologias, objetivos, arquitetura e instruções de desenvolvimento local).

---

## Critérios de Aceite

- [ ] O campo de busca deve aparecer no canto superior direito do menu principal e permitir pesquisa offline de títulos e conteúdos dos posts.
- [ ] A página principal do blog deve renderizar a lista de posts sob títulos de agrupamento no formato "YYYY - Nome do Mês por Extenso" (ex: "2026 - Junho").
- [ ] Os nomes dos meses nos agrupamentos devem ser traduzidos para português (ex: "Junho" em vez de "June").
- [ ] A navegação lateral direita (TOC) da página principal deve conter links funcionais que apontam para as seções de cada mês/ano na mesma página.
- [ ] O favicon exibido na aba do navegador em todas as páginas do site deve ser o logotipo "N" fornecido pelo usuário.
- [ ] O comando de compilação do Hugo (`./hugo`) deve rodar com sucesso sem erros de compilação de layouts.
- [ ] O arquivo `README.md` no root do projeto deve descrever com precisão o blog pessoal `nickevangelista's blog`, suas tecnologias e instruções de compilação/deploy, em vez do conteúdo padrão do Hugo.

---

## Tasks / Fixes

[Descoberto durante pesquisa]

1. **Configuração da Busca no `hugo.toml`:**
   - Adicionar uma nova entrada no array de menus `[[menu.main]]` com o parâmetro `params.type = "search"` para ativar a pesquisa local via FlexSearch do Hextra.
   
2. **Configuração de Localização no `hugo.toml`:**
   - Adicionar os parâmetros `languageCode = 'pt-br'` e `defaultContentLanguage = 'pt'` para forçar o Hugo a utilizar o locale em português para formatação e tradução de datas.

3. **Criação do Layout da Página Inicial (`layouts/index.html`):**
   - Sobrescrever o layout da home page criando `layouts/index.html`.
   - Implementar a lógica de agrupamento de posts da seção `/posts` usando `.GroupByDate "2006-01"`.
   - Utilizar a função `time.Format` com o formato `"2006 - January"` para exibir o título do grupo localizado (ex: "2026 - Junho").
   - Gerar âncoras válidas nos cabeçalhos `h2` usando o formato formatado de data urlizado (ex: `id="{{ $date | time.Format "2006-january" | urlize }}"`).
   - Estruturar uma barra de navegação TOC personalizada na lateral direita que replique dinamicamente estes cabeçalhos para manter a funcionalidade do sidebar de navegação "Nesta página".

4. **Configuração do Favicon "N":**
   - O arquivo do favicon foi localizado na pasta de downloads (`C:\Users\nicol\Downloads\ChatGPT Image 3 de jun. de 2026, 12_48_01.png`).
   - Copiar o arquivo de imagem para o diretório de assets estáticos do blog (`static/favicon.png`).
   - Criar uma sobreposição de partial em `layouts/partials/favicons.html` para forçar o uso do novo arquivo `favicon.png` para ícone do navegador e atalho da Apple Touch.

5. **Refatoração do `README.md`:**
   - Reescrever o arquivo `README.md` substituindo a documentação padrão do Hugo por informações reais do blog de Nícolas Evangelista, detalhando a arquitetura Hugo + Hextra, a estrutura e como testar/publicar localmente.

6. **Validação:**
   - Executar a compilação local via script `wsl bash run_hugo.sh`.
   - Verificar os arquivos de saída gerados na pasta `public/` para garantir que o favicon e as listas de posts agrupadas estão presentes.

---

## Arquivos Relevantes

### Configuração e Infraestrutura

| Arquivo | Status | Linhas-Chave | Relevância |
|---------|--------|--------------|------------|
| `hugo.toml` | MODIFIED | L2-L3, L11-L14 | Onde registramos o locale de data e a entrada do menu de busca do Hextra. |
| [static/favicon.png](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/static/favicon.png) | [NEW] | — | O arquivo da imagem de favicon customizada. |
| [README.md](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/README.md) | MODIFIED | L1-L281 | Substituir documentação padrão do Hugo pelas especificações e guias de execução do blog nickevangelista. |

### Frontend e Layouts

| Arquivo | Status | Linhas-Chave | Relevância |
|---------|--------|--------------|------------|
| [layouts/index.html](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/layouts/index.html) | [NEW] | L1-L40 | Layout da home page customizado para renderizar a lista de posts e o TOC agrupado por data. |
| [layouts/partials/favicons.html](file:///wsl.localhost/Ubuntu/home/nicol/projetos/blog/layouts/partials/favicons.html) | [NEW] | L1-L2 | Partial customizado para forçar o carregamento do `favicon.png`. |

---

## Padrões e Convenções Aplicáveis

- **Hugo Layout Overrides:** Arquivos colocados sob a pasta `layouts/` local do projeto sempre substituem arquivos homônimos do tema carregado via Go Module.
- **Visualização Localizada de Datas (time.Format):** Para traduzir datas nativamente sem lógica customizada, utiliza-se a função locale-aware `time.Format` (e não `.Format` direto do objeto de tempo do Go).
- **FlexSearch Integrado:** Hextra já vem com a lógica do FlexSearch embarcada no menu de tipo `search`, não requerendo a instalação de dependências ou injeção manual de JavaScript.

---

## Riscos e Observações

- **Tradução automática de meses:** A tradução automática de `"January"` para `"Janeiro"` depende da correta resolução dos arquivos internos do Hugo e locale do WSL. Devemos validar a saída renderizada no HTML gerado para garantir que a compilação local resolveu para português.
- **Geração de Âncoras Duplicadas:** Se houver múltiplos agrupamentos ou caracteres especiais, a função `urlize` deve ser usada de forma consistente entre o cabeçalho `h2` e a âncora no menu TOC (`href="#..."`).

---

## Referências

- Favicon "N" fornecido pelo usuário (cópia persistida na pasta de artefatos):
![Favicon do N](C:/Users/nicol/.gemini/antigravity/brain/1173eb61-fa4b-49f0-a63b-37359d325954/favicon.png)
- Repositório de Inspiração: [akitaonrails.github.io](https://github.com/akitaonrails/akitaonrails.github.io)
- Documentação do Hextra (Busca): [hextra.im](https://hextra.im/)
- Skill de Planning: `.agents/skills/tlc-spec-driven`
