# language: pt

Funcionalidade: Uso de cupons no checkout
  Como um usuário do site de venda de cafés, eu quero poder aplicar cupons de desconto na página de checkout
  Para que eu possa obter reduções no preço de produtos e melhorar minha experiência de compra

  Contexto:
    Dado que iniciei a compra do item:
      | name     | Café com Leite |
      | price    | R$ 19,99       |
      | delivery | R$ 10,00       |
      | total    | R$ 29,99       |

  Cenário: Aplicar desconto de 20%
    Quando aplico o seguinte cupom: "MEUCAFE"
    Então o valor final da compra deve ser atualizado para "R$ 25,99"

  Cenário: Cupom expirado
    Quando aplico o seguinte cupom: "PROMO20"
    Então devo ver a seguinte notificação "Cupom expirado!"
    E o valor final da compra deve permanecer o mesmo

  Cenário: Cupom inválido
    Quando aplico o seguinte cupom: "PROMO100"
    Então devo ver a seguinte notificação "Cupom inválido!"
    E o valor final da compra deve permanecer o mesmo
