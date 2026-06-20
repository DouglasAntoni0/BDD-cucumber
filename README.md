# ☕ BDD com Cucumber — Starbugs Coffee

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Cucumber](https://img.shields.io/badge/Cucumber-23D96C?style=for-the-badge&logo=cucumber&logoColor=white)
![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white)
![Capybara](https://img.shields.io/badge/Capybara-8B0000?style=for-the-badge&logoColor=white)

Bem-vindo(a) ao repositório do meu projeto de estudos sobre **BDD (Behavior Driven Development)** utilizando o framework **Cucumber** com a linguagem **Ruby**.

Este projeto faz parte de um curso que estou realizando e serve como um **portfólio prático de testes automatizados**. O repositório está em **constante atualização** — à medida que avanço nos estudos, adiciono novas funcionalidades, novos cenários de teste e aprimoro o código existente.

---

## 🚀 Sobre o Projeto

O projeto em desenvolvimento no momento é o **Starbugs** — uma aplicação web de cafeteria onde implementamos testes guiados por comportamento (BDD).

A ideia central é:

> Escrever cenários de teste em **linguagem natural (Gherkin)** para garantir que a aplicação funcione exatamente como esperado do ponto de vista do usuário.

🔗 **Aplicação testada:** [starbugs.vercel.app](https://starbugs.vercel.app/)

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Finalidade |
|:---:|:---|
| [Ruby](https://www.ruby-lang.org/pt/) | Linguagem de programação principal |
| [Cucumber](https://cucumber.io/) | Framework BDD para execução de cenários em Gherkin |
| [Capybara](https://github.com/teamcapybara/capybara) | DSL para interação com elementos da interface web |
| [Selenium WebDriver](https://www.selenium.dev/) | Automação do navegador (Chrome) |
| [RSpec](https://rspec.info/) | Biblioteca de asserções (expects/matchers) |
| [Bundler](https://bundler.io/) | Gerenciamento de dependências Ruby (Gemfile) |

---

## 📁 Estrutura do Projeto

```
starbugs-cucumber/
├── Gemfile                                  # Dependências do projeto
├── Gemfile.lock                             # Lock das versões das gems
├── cucumber.yml                             # Configuração do Cucumber
├── README.md                                # Documentação do projeto
└── features/
    ├── catalogo.feature                     # Cenários BDD — Catálogo de cafés
    ├── pedido.feature                       # Cenários BDD — Fluxo de pedidos
    ├── step_definitions/
    │   ├── steps.rb                         # Steps do catálogo
    │   ├── pedidos_steps.rb                 # Steps dos pedidos
    │   └── catalogo_steaps.rb               # (reservado para futuros steps)
    └── support/
        ├── env.rb                           # Configuração do Capybara e Selenium
        ├── hooks.rb                         # Hooks — inicialização dos Page Objects
        └── pages/
            ├── home.rb                      # Page Object — Página principal
            ├── checkout.rb                  # Page Object — Página de checkout
            └── components.rb                # Page Object — Componentes (popups)
```

---

## 🧩 Arquitetura — Page Object Pattern

O projeto utiliza o padrão **Page Object** para organizar a interação com a interface da aplicação. Cada página ou componente é representado por uma classe Ruby que encapsula os seletores e ações correspondentes:

| Classe | Arquivo | Responsabilidade |
|:---|:---|:---|
| `HomePage` | `pages/home.rb` | Navegar à página principal, listar cafés e iniciar compra |
| `CheckoutPage` | `pages/checkout.rb` | Validar detalhes do produto, buscar CEP, preencher endereço, escolher pagamento e finalizar pedido |
| `Popup` | `pages/components.rb` | Validar popups de alerta (SweetAlert2) |

As instâncias são inicializadas automaticamente no **hook** `Before`, disponibilizando `@home`, `@checkout` e `@popup` para todos os steps.

---

## 📝 Cenários de Teste

### 📦 Feature: Catálogo de Cafés

Cenários escritos em **Gherkin** (português) no arquivo [`catalogo.feature`](features/catalogo.feature).

#### ✅ Cenário 1 — Acessar o catálogo de cafés

Valida que ao acessar a página principal, uma lista de cafés é exibida.

```gherkin
Cenário: Acessar o catálogo de cafés na pagina principal
  Quando acesso a página principal da Starbugs
  Então eu devo ver uma lista de cafés disponíveis
```

#### ✅ Cenário 2 — Iniciar a compra de um café

Simula o fluxo completo de compra: selecionar um café, verificar os detalhes no checkout e validar o valor total (produto + entrega).

Utiliza uma **tabela Gherkin** para passar os dados do produto de forma organizada, convertida em hash no step definition via `rows_hash`.

```gherkin
Cenário: Iniciar a compra de um café
  Dado que estou na página de principal da Starbugs
  E que desejo comprar o seguinte produto:
    | name     | Expresso Gelado |
    | price    | R$ 9,99         |
    | delivery | R$ 10,00        |
  Quando inicio a compra desse item
  Então devo ver a pagina de Checkout com os detalhes do produto
  E o valor total da compra deve ser "R$ 19,99"
```

#### ✅ Cenário 3 — Café indisponível

Testa o comportamento quando um produto indisponível é selecionado. Verifica que a aplicação exibe um **popup de alerta** (SweetAlert2) informando ao usuário que o produto não está disponível.

```gherkin
Cenário: Café indisponivel
  Dado que estou na página de principal da Starbugs
  E que desejo comprar o seguinte produto:
    | name | Expresso Cremoso |
  Quando inicio a compra desse item
  Então devo ver um popup informando que o produto está indisponivel
```

---

### 🛒 Feature: Pedidos

Cenários escritos no arquivo [`pedido.feature`](features/pedido.feature), cobrindo o fluxo completo de compra — da seleção do produto até a confirmação do pedido.

#### 🔧 Cenário 4 — Compra bem sucedida

Testa o fluxo end-to-end de uma compra: selecionar produto, buscar CEP, preencher endereço, escolher forma de pagamento e finalizar o pedido.

```gherkin
Cenario: Compra bem sucedida
  Dado que estou na pagina principal da Starbugs
  E que iniciei a compra do item "Expresso Tradicional"
  Quando faço a busca do seguinte CEP: "04534011"
  E informo os demais dados do endereço:
    | Numero      | 1000    |
    | Complemento | Apto 22 |
  E escolho a forma de pagamento "Cartão de Débito"
  E por fim finalizo a compra
  Então sou redirecionado para a página de confirmação de Pedidos
  E deve ser informando um prazo de entrega entrega entre 20 a 30 minutos
```

> [!NOTE]
> Os dois últimos steps de validação estão marcados como `pending` e serão implementados em breve.

---

## ⚙️ Configuração do Ambiente

O [`env.rb`](features/support/env.rb) configura o Capybara para usar o **Selenium com Chrome**:

```ruby
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 5
end
```

O [`hooks.rb`](features/support/hooks.rb) inicializa os Page Objects antes de cada cenário:

```ruby
Before do
  @home = HomePage.new
  @checkout = CheckoutPage.new
  @popup = Popup.new
end
```

---

## 📋 Pré-requisitos

Antes de executar o projeto, certifique-se de ter instalado:

- [x] **Ruby** (versão 3.0+) — [Download](https://www.ruby-lang.org/pt/downloads/)
- [x] **Bundler** — instale com `gem install bundler`
- [x] **Google Chrome** — navegador utilizado para a automação
- [x] **ChromeDriver** — compatível com a versão do seu Chrome

> [!TIP]
> No Windows, recomendo usar o [RubyInstaller](https://rubyinstaller.org/) para facilitar a instalação do Ruby e suas dependências.

---

## 💡 Como executar localmente

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/DouglasAntoni0/BDD-cucumber.git
   ```

2. **Acesse a pasta do projeto:**

   ```bash
   cd BDD-cucumber/projects/starbugs-cucumber
   ```

3. **Instale as dependências:**

   ```bash
   bundle install
   ```

4. **Execute todos os testes:**

   ```bash
   bundle exec cucumber
   ```

5. **Execute cenários por tag (opcional):**

   ```bash
   # Executar apenas cenários marcados com @smoke
   bundle exec cucumber -t @smoke

   # No PowerShell, escape o @
   bundle exec cucumber -t "@smoke"
   ```

---

## 🧪 Resultado Esperado

Ao rodar `bundle exec cucumber`, o terminal exibirá algo como:

```
Using the default profile...

Funcionalidade: Catálogo de cafés

  Cenário: Acessar o catálogo de cafés na pagina principal  ✅
  Cenário: Iniciar a compra de um café                      ✅
  Cenário: Café indisponivel                                ✅

Funcionalidade: Pedidos

  Cenario: Compra bem sucedida                              ⏳ (pending)

4 scenarios (1 pending, 3 passed)
19 steps (17 passed, 1 pending, 1 skipped)
```

---

## 🌱 Status do Projeto

🚧 **Em Desenvolvimento Contínuo** — Cenários do catálogo passando ✅ | Pedidos em progresso ⏳

Este projeto está em constante evolução. À medida que avanço no curso, vou implementando novos cenários, novas features e aprimorando o código existente.

| Funcionalidade | Status |
|:---|:---:|
| Catálogo de cafés | ✅ Concluído |
| Fluxo de compra (checkout) | ✅ Concluído |
| Produto indisponível (popup) | ✅ Concluído |
| Dados via tabelas Gherkin (rows_hash) | ✅ Concluído |
| Page Object Pattern | ✅ Concluído |
| Hooks (inicialização automática) | ✅ Concluído |
| Pedidos — fluxo completo (CEP, endereço, pagamento) | 🔧 Em andamento |
| Validação da confirmação de pedido | 📋 Planejado |

> [!NOTE]
> Este repositório é um **"organismo vivo"**. Volte sempre para conferir as novas atualizações, automações e melhorias que estou implementando ao longo da minha jornada de aprendizado!

---

## 📚 O que eu aprendi até agora

- ✅ Escrever cenários BDD com a sintaxe Gherkin em português
- ✅ Conectar steps em Gherkin com código Ruby utilizando expressões regulares e `{string}`
- ✅ Configurar o Capybara com Selenium para automação web
- ✅ Usar seletores CSS para interagir com elementos da página
- ✅ Utilizar asserções RSpec (`expect`, `to eq`, `to eql`, `to be >`)
- ✅ Compartilhar estado entre steps usando variáveis de instância (`@product`)
- ✅ Gerenciar dependências com Bundler e Gemfile
- ✅ Configurar o Cucumber com `cucumber.yml`
- ✅ Executar testes filtrados por tags (`-t @tag`)
- ✅ Usar tabelas Gherkin com `rows_hash` para passar dados estruturados aos steps
- ✅ Validar popups e alertas de UI (SweetAlert2) nos testes
- ✅ Reutilizar steps genéricos para diferentes cenários de teste
- ✅ Implementar o padrão **Page Object** para organizar a automação
- ✅ Utilizar **hooks** (`Before`) para inicializar objetos antes dos cenários
- ✅ Separar step definitions por feature (catalogo, pedidos)
- ✅ Automatizar interações com formulários (CEP, endereço, pagamento)

---

## 🤝 Contribuições

Este é um projeto de estudos pessoal, mas sugestões e feedbacks são sempre bem-vindos! Sinta-se à vontade para abrir uma **issue** ou enviar um **pull request**.

---

## 📄 Licença

Este projeto é de uso livre para fins educacionais.

---

> **Feito com ☕ e dedicação por [Douglas Antonio](https://github.com/DouglasAntoni0)**
