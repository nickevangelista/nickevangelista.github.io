---
title: "Relatório sobre o Uso de IA Generativa Local"
date: 2026-06-08
draft: false
---
## O Lançamento da Ferramenta Odysseus e o Primeiro Contato
Dia 31 de Maio de 2026 ficou evidenciado ao mundo um dos principais benefícios da IA generativa para código. Nesse dia, uma das vozes mais famosas do Youtube clicou em um botão de “Upload” e o mundo teve o vislumbre dessa resposta. O criador de conteúdo, Pewdiepie, publicou um vídeo falando sobre sua ferramenta “Odysseus”, que basicamente é um “workspace” local para agentes de IA. Naquela semana, só se falava disso. Então, decidi me aventurar e testar essa nova ferramenta. Só tinha um detalhe que era incomum para o meu uso de agentes para código, esse workspace era “designed” para modelos locais, algo que eu nunca tinha testado continuamente. Então, tive minha primeira experiência. Fui ao site do huggingface.com e baixei um modelo (qwen2.5-coder-3b-instruct) que aparentemente era compatível com minha GPU (RTX 3050 mobile no laptop) e “entrei mar adentro”.

## Desempenho e Primeiras Impressões do Modelo Local
A experiência foi no mínimo intrigante. Claro, como devia se esperar o modelo era consideravelmente mais lento que modelos como gemini, claude or codex. A qualidade das suas respostas também não eram nem perto de nenhum desses outros modelos. Mas o fato de poder usar aquilo localmente, sem precisar de internet era surreal naquele momento.

## Dificuldades e Limitações como Agente
Tive problemas em usar ele como agente e para ler documentos com muitas vezes ele só não funcionando e outras ele funcionando, mas demorando.

## Funcionalidades do Workspace e Privacidade de Dados
De longe, as ferramentas integradas no “workspace” era a coisa mais legal. A memória persistente, com os modelos/agentes com a habilidade de evoluir conforme tu interages com ele e “salva” informações nele, sem se preocupar se tem alguma empresa roubando teus dados é absurda. Além disso, há diversas ferramentas para integrar os agentes com emails, notas, “tasks”, lembretes, calendário etc.

## Facilidade de Configuração e o Cookbook de Felix Kjellberg
Mas não é só isso, o criador da ferramenta, Felix Kjellberg, teve o trabalho de criar um “cookbook” para que a ferramenta pudesse escanear o hardware do usuário, recomendar modelos, baixar eles e colocá-los para funcionar, tudo de maneira extremamente acessível.

## O Impacto do Harness e Perspectivas para o Futuro
Em resumo, o Harness criado para os modelos é extremamente surpreendente, é com certeza deve se estudado para futuras implementações em agentes distribuídos por empresas como Anthropic, Google, OpenAI etc.

## Conclusão: A Democratização da Criação de Projetos
A resposta de um dos principais benefícios da IA generativa é que ela permitiu ideias e projetos criarem vida. Tanto pessoas que já sabiam como programar quanto pessoas que nunca estudaram programação, agora podem tirar seus rascunhos de projetos do papel e darem vida a eles de forma razoavelmente acessível assim como Felix fez.
