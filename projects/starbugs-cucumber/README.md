# Starbugs - Automação de Testes BDD

Projeto de automação de testes utilizando Ruby e Cucumber para a aplicação Starbugs.

## Funcionalidades Testadas

- **Catálogo de cafés:** Verificação da exibição da lista de cafés na página principal.

## Tecnologias Utilizadas

- Ruby
- Cucumber
- RSpec (Core/Expectations)

## Como executar os testes

1. Certifique-se de ter o Ruby instalado e o Bundler.
2. Instale as dependências:
   ```bash
   bundle install
   ```
3. Execute o Cucumber:
   ```bash
   bundle exec cucumber
   ```

## Estrutura do Projeto

- `features/` - Contém as especificações em Gherkin (`.feature`) e as definições de passos (`step_definitions/`).
- `cucumber.yml` - Arquivo de configuração do Cucumber (como a desativação da publicação de relatórios na nuvem).
