# Curso BDD com Cucumber 🥒

Bem-vindo(a) ao repositório do meu projeto de estudos sobre BDD (Behavior Driven Development) utilizando o framework Cucumber com a linguagem Ruby.

Este projeto faz parte de um curso que estou realizando e serve como um portfólio prático de testes automatizados. O repositório está em **constante atualização**, pois à medida que avanço nos estudos, adiciono novas funcionalidades, novos cenários de teste e aprimoro o código existente.

## 🚀 O que é este projeto?

O projeto em desenvolvimento no momento é o **Starbugs**, uma aplicação prática onde implementamos testes guiados por comportamento (BDD). A ideia é escrever cenários de teste em linguagem natural (Gherkin) para garantir que a aplicação funcione exatamente como esperado do ponto de vista do usuário.

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** [Ruby](https://www.ruby-lang.org/pt/)
- **Framework de Testes:** [Cucumber](https://cucumber.io/)
- **Padrão de Escrita:** BDD / Gherkin
- **Gerenciador de Dependências:** Bundler (Gemfile)

## 📁 Estrutura do Projeto

A estrutura principal dos testes está localizada no diretório `projects/starbugs-cucumber/`:
- `features/`: Contém os arquivos `.feature` escritos em Gherkin.
  - Exemplo atual: `catalogo.feature` (Cenários de teste do catálogo).
- `features/step_definitions/`: Contém os passos (`steps.rb`) em Ruby que conectam os cenários descritos em Gherkin com a execução da automação.
- `features/support/`: Arquivos de configuração de ambiente (`env.rb`).
- `cucumber.yml`: Arquivo de configuração do Cucumber (ex: desabilita a publicação de relatórios na nuvem).

## 🌱 Status do Projeto

⚠️ **Em Desenvolvimento Contínuo**

Este repositório é um "organismo vivo". Volte sempre para conferir as novas atualizações, novas automações e melhorias de código que estou implementando ao longo da minha jornada de aprendizado!

## 💡 Como executar localmente

1. Clone o repositório:
   ```bash
   git clone https://github.com/DouglasAntoni0/BDD-cucumber.git
   ```
2. Acesse a pasta do projeto:
   ```bash
   cd BDD-cucumber/projects/starbugs-cucumber
   ```
3. Instale as dependências usando o Bundler:
   ```bash
   bundle install
   ```
4. Execute os testes com o Cucumber utilizando o Bundler:
   ```bash
   bundle exec cucumber
   ```
