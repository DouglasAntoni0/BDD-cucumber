# BDD com Cucumber | Starbugs Coffee

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Cucumber](https://img.shields.io/badge/Cucumber-23D96C?style=for-the-badge&logo=cucumber&logoColor=white)
![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white)
![Capybara](https://img.shields.io/badge/Capybara-8B0000?style=for-the-badge&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)

Projeto de automação E2E para a aplicação **Starbugs Coffee**, construído com **Ruby, Cucumber, Capybara e Selenium WebDriver**. A proposta é validar fluxos reais de usuário com cenários BDD escritos em português, mantendo o código limpo, legível e preparado para execução local e em pipeline de CI/CD.

A aplicação testada está disponível em: [https://starbugs-qa.vercel.app](https://starbugs-qa.vercel.app)

## Visão Geral

Este repositório representa uma base prática de testes automatizados com foco em qualidade de produto, clareza de comunicação e manutenção sustentável. Os cenários foram organizados para documentar comportamento esperado, enquanto a implementação usa Page Object para reduzir duplicação e manter a automação fácil de evoluir.

A estrutura foi pensada para demonstrar domínio dos pontos que realmente importam em automação de testes: leitura simples dos cenários, separação clara de responsabilidades, execução reproduzível, evidências em falha e integração com GitHub Actions.

## Stack Técnica

| Tecnologia | Papel no projeto |
|:---|:---|
| Ruby | Linguagem principal da automação |
| Cucumber | Execução dos cenários BDD em Gherkin |
| Capybara | DSL para interação com a interface web |
| Selenium WebDriver | Controle do navegador Chrome |
| RSpec Matchers | Asserções dos resultados esperados |
| Bundler | Gerenciamento das dependências Ruby |
| GitHub Actions | Pipeline de CI/CD para execução automatizada |

## Arquitetura

O projeto usa o padrão **Page Object**, mantendo a regra de negócio dos testes separada dos seletores e ações de tela. Isso deixa os steps mais expressivos e reduz o impacto de mudanças na interface.

| Classe | Responsabilidade |
|:---|:---|
| `HomePage` | Acessa a aplicação, lista cafés e inicia compras |
| `CheckoutPage` | Valida produto, total, endereço, pagamento, cupons e notificações |
| `OrderPage` | Valida a confirmação do pedido e o prazo de entrega |
| `Popup` | Centraliza validações de mensagens em popup |

Os objetos são inicializados automaticamente no hook `Before`, deixando `@home`, `@checkout`, `@order` e `@popup` disponíveis para os cenários.

## Cenários Automatizados

A suíte cobre os principais fluxos da jornada do usuário:

| Feature | Cobertura |
|:---|:---|
| Catálogo | Acesso ao catálogo, compra inicial e produto indisponível |
| Pedidos | Compra completa com CEP, endereço, pagamento e confirmação |
| Cupons | Cupom válido, cupom expirado e cupom inválido |

Baseline atual da suíte:

```text
7 scenarios (7 passed)
30 steps (30 passed)
```

## Estrutura Do Projeto

```text
projects/starbugs-cucumber/
├── Gemfile
├── Gemfile.lock
├── cucumber.yml
└── features/
    ├── catalogo.feature
    ├── cupom.feature
    ├── pedido.feature
    ├── step_definitions/
    │   ├── cupom_steps.rb
    │   ├── pedidos_steps.rb
    │   └── steps.rb
    └── support/
        ├── env.rb
        ├── hooks.rb
        └── pages/
            ├── checkout.rb
            ├── components.rb
            ├── home.rb
            └── order.rb
```

## Pré-requisitos

Antes de executar, mantenha estes itens instalados:

- Ruby 4.0 ou versão compatível com as gems do projeto.
- Bundler para instalação das dependências.
- Google Chrome para execução dos testes E2E.
- Acesso à internet para abrir a aplicação QA e, quando necessário, baixar dependências.

Com Selenium 4, o gerenciamento do driver do Chrome é feito automaticamente pelo Selenium Manager na maioria dos ambientes.

## Como Executar Localmente

Clone o repositório e acesse o projeto:

```bash
git clone https://github.com/DouglasAntoni0/BDD-cucumber.git
cd BDD-cucumber/projects/starbugs-cucumber
```

Instale as dependências:

```bash
bundle install
```

Execute a suíte completa:

```bash
bundle exec cucumber
```

Execute apenas a validação de carregamento dos cenários e steps:

```bash
bundle exec cucumber --dry-run
```

Execute um cenário ou grupo por tag, quando houver tags configuradas:

```bash
bundle exec cucumber -t "@smoke"
```

## Configurações De Ambiente

A automação usa `https://starbugs-qa.vercel.app` como ambiente padrão. Para apontar para outro ambiente, use `STARBUGS_BASE_URL`:

```bash
STARBUGS_BASE_URL="https://sua-url.com" bundle exec cucumber
```

No PowerShell:

```powershell
$env:STARBUGS_BASE_URL = "https://sua-url.com"
bundle exec cucumber
```

Por padrão, a execução local usa Chrome visível. Em CI, o projeto usa Chrome headless automaticamente. Também é possível forçar o driver manualmente:

```bash
CAPYBARA_DRIVER="selenium_chrome_headless" bundle exec cucumber
```

## CI/CD

O projeto possui workflow em `.github/workflows/ci.yml`, executado em:

- `push` na branch `main`
- `pull_request`
- execução manual via `workflow_dispatch`

A pipeline roda no Ubuntu, instala Ruby com cache de Bundler, executa `bundle exec cucumber` dentro de `projects/starbugs-cucumber` e publica `logs/` como artefato quando ocorre falha. Isso cria uma trilha mínima de evidência para investigar problemas sem poluir o repositório com screenshots locais.

## Padrão De Qualidade

Alguns cuidados aplicados nesta base:

- Cenários Gherkin em português, com linguagem clara e foco no comportamento do usuário.
- Page Objects com responsabilidades pequenas e bem definidas.
- Steps objetivos, reaproveitáveis e alinhados à escrita dos cenários.
- Configuração headless isolada para CI, preservando a experiência local.
- `.editorconfig` e `.gitattributes` para manter espaçamento, indentação e quebras de linha consistentes.
- `.gitignore` para evitar versionamento de evidências locais e arquivos temporários.

## Status

| Área | Status |
|:---|:---:|
| Catálogo de cafés | Concluído |
| Produto indisponível | Concluído |
| Fluxo completo de pedidos | Concluído |
| Validação de cupons | Concluído |
| Page Object Pattern | Concluído |
| GitHub Actions | Concluído |
| Evidências em falha | Concluído |

## Autor

Projeto desenvolvido por [Douglas Antonio](https://github.com/DouglasAntoni0), com foco em demonstrar uma abordagem cuidadosa para automação de testes E2E, escrita de cenários BDD e organização profissional de código.
