# language: pt
@geral
Funcionalidade: Geral

@login
Cenário: Login Usuário Válido

Dado que estou na tela de login
Quando tento fazer um login com um usuário Válido
Então devo me logar

@pedido @mono @boleto
Cenário: Fechar pedido boleto

Dado que estou logado
Quando pesquiso por um produto
    E vou para a pdp do produto
    E adiciono o produto ao carrinho
    E vou para tela de entrega
    E seleciono o tipo de entrega
    E seleciono o tipo de pagamento boleto
Então fecho o pedido

@pesquisasli
Cenário: Realizar uma pesquisa

Dado que estou na home 
Quando realizao uma pesquisa
    E listo os nomes dos quatros primeiros produtos
    E tiro um print screen dos quatros primeiros produtos
    E realizo um scroll ate o rodapé da pagina
Então tira um print screen do rodapé da pagina   