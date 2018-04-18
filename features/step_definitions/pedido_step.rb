Quando("pesquiso por um produto") do
  @browser.text_field(class:'form-field').set 'corda'
  @browser.button(title:'Buscar').click
end

Quando("vou para a pdp do produto") do
  @browser.lis(class:['sli_grid_container']).first.click
end

Quando("adiciono o produto ao carrinho") do
  @browser.ul(class:'selector-list').lis.select{|x| x.label}.sample.click
  @browser.div(class:['holder', 'clearfix']).lis.select{|a| !a.span.class_name.match('Indisponivel') && !a.span.text.empty?}.sample.click
  @browser.button(class:['form-submitRed', 'large', 'buy', 'available']).click
end

Quando("vou para tela de entrega") do
  produto = @browser.td(class:['cell', 'product']).exists?
  if produto == true
      puts 'Produto no carrinho'
      @browser.execute_script("window.scrollBy(0,200)")
      @browser.screenshot.save "./screenshots/#{Data_time}/Produto.png"
  else
      puts 'Não há produto no carrinho'
  end
  @browser.button(class:['form-submit', 'large', 'next-step', 'concluir-pedido-carrinho-novo']).click
end

Quando("seleciono o tipo de entrega") do
  telaEntrega = @browser.div(class:['mirage', 'single']).exists?
    if telaEntrega == true
        puts 'Você está na tela de entrega'
        @browser.screenshot.save "./screenshots/#{Data_time}/TelaEntrega.png"
      else
        puts 'Você não está na tela de entrega'
      end 
    @browser.label(for:'Entregas[0].TipoEntrega-1').click
    tipoEntrega = @browser.div(class:['iradio_minimal', 'checked']).input.attribute('id')
    if tipoEntrega == 'Entregas[0].TipoEntrega-1'
      puts 'Tipo Entrega Normal Selecionada'
      @browser.screenshot.save "./screenshots/#{Data_time}/TipoEntrega.png"
      end
    @browser.button(text:'Ir para o pagamento').click
end

Quando("seleciono o tipo de pagamento boleto") do
  @browser.a(class:['item','boleto']).click
end

Então("fecho o pedido") do
  @browser.buttons(class: ['form-submit', 'next-step']).select{|a| a.present?}.first.click
    pedidoRealizado = @browser.div(class:['productList', 'productList-store',  'novo-checkout-nps']).exists?
    if pedidoRealizado == true
        puts "Seu pedido: #{@browser.div(class:'txt-Numberorder-text').span.text}, foi realizado com sucesso!"
        @browser.screenshot.save "./screenshots/#{Data_time}/PedidoRealizado.png"
      end
end