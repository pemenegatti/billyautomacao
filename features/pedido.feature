# language: pt
@pedido
Funcionalidade: Pedido

@login
Cenário: Login Usuário Válido

Dado que estou na tela de login
Quando tento fazer um login com um usuário Válido
Então devo me logar

@pesquisa
Cenário: Pesquisar um produto 

Dado que estou na home do site
Quando tento fazer uma busca de um produto
Então devo selecionar produto pesquisado

@addcarrinho
Cenário: Adicionar um produto ao carrinho 

Dado que estou na pdp de um produto
Quando tento selecionar tamanho e cor
Então devo addcarrinho ao carrinho

@carrinho
Cenário: Concluir produto no carrinho 

Dado que estou no carrinho
Então devo clicar em cuncluir pedido

@telaentrega
Cenário: Selecionar Tipo de entrega 

Dado que estou na tela de entrega
Quando tento selecionar tipo de entrega
Então devo selecionar entrega normal

@fecharpedido
Cenário: Fechar o pedido 

Dado que estou na tela de pagamento
Então devo selecionar pagamento boleto

@buscasli
Cenário: Buscar produto SLI 

Dado que estou realizando uma busca na SLI
Então devo pesquisar por um item