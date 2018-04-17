Dado("que estou na tela de login") do
    @browser.goto 'www.centauro.com.br'
  end
  
  Quando("tento fazer um login com um usuário Válido") do
    @browser.a(text:'Entre | Cadastre-se').click
    @browser.text_field(class:'box-TipoUser').set 'pedrotestescentauro@mailinator.com'
    @browser.input(id:'optYesclient').click
    @browser.text_field(name:'Senha').set '123'
    @browser.input(id:'btn_Entrar').click
  end

  Então("devo me logar") do
    logado = @browser.ps(class: ['user-greeting-logout', 'login-name']).select{|e| e.visible?}.first.text.include? "Olá"
    @browser.screenshot.save "./screenshots/#{Data_time}/Logado.png"
  end
    
  Dado("que estou na home do site") do
    assertUrlHome = @browser.url == 'https://www.centauro.com.br/'
  end
  
  Quando("tento fazer uma busca de um produto") do
    @browser.text_field(class:'form-field').set 'barrinha'
    @browser.button(title:'Buscar').click
  end
  
  Então("devo selecionar produto pesquisado") do
    @browser.lis(class:['sli_grid_container']).first.click
  end
  
  Dado("que estou na pdp de um produto") do
    @browser.div("data-funcionalidade":'pdp').exists?
  end
  
  Quando("tento selecionar tamanho e cor") do
    @browser.ul(class:'selector-list').lis.select{|x| x.label}.sample.click
    @browser.div(class:['holder', 'clearfix']).lis.select{|a| !a.span.class_name.match('Indisponivel') && !a.span.text.empty?}.sample.click
  end
  
  Então("devo addcarrinho ao carrinho") do
    @browser.button(class:['form-submitRed', 'large', 'buy', 'available']).click
  end

  Dado("que estou no carrinho") do
    produto = @browser.td(class:['cell', 'product']).exists?
    if produto == true
        puts 'Produto no carrinho'
        @browser.execute_script("window.scrollBy(0,200)")
        @browser.screenshot.save "./screenshots/#{Data_time}/Produto.png"
    else
        puts 'Não há produto no carrinho'
    end
  end
  
  Então("devo clicar em cuncluir pedido") do
    @browser.button(class:['form-submit', 'large', 'next-step', 'concluir-pedido-carrinho-novo']).click
  end

  Dado("que estou na tela de entrega") do
    telaEntrega = @browser.div(class:['mirage', 'single']).exists?
    if telaEntrega == true
        puts 'Você está na tela de entrega'
        @browser.screenshot.save "./screenshots/#{Data_time}/TelaEntrega.png"
    else
        puts 'Você não está na tela de entrega'
    end    
  end
  
  Quando("tento selecionar tipo de entrega") do
    @browser.label(for:'Entregas[0].TipoEntrega-1').click
    tipoEntrega = @browser.div(class:['iradio_minimal', 'checked']).input.attribute('id')
    if tipoEntrega == 'Entregas[0].TipoEntrega-1'
      puts 'Tipo Entrega Normal Selecionada'
      @browser.screenshot.save "./screenshots/#{Data_time}/TipoEntrega.png"
    end
  end
  
  Então("devo selecionar entrega normal") do
    @browser.button(text:'Ir para o pagamento').click
  end

  Dado("que estou na tela de pagamento") do
    @browser.a(class:['item','boleto']).click
  end
  
  Então("devo selecionar pagamento boleto") do
    @browser.buttons(class: ['form-submit', 'next-step']).select{|a| a.present?}.first.click
    pedidoRealizado = @browser.div(class:['productList', 'productList-store',  'novo-checkout-nps']).exists?
    if pedidoRealizado == true
        puts "Seu pedido: #{@browser.div(class:'txt-Numberorder-text').span.text}, foi realizado com sucesso!"
        @browser.screenshot.save "./screenshots/#{Data_time}/PedidoRealizado.png"
    end
  end

  Dado("que estou realizando uma busca na SLI") do
    @browser.a(id:'home').click
    @browser.text_field(class:'form-field').set 'cadarco'
    @browser.button(title:'Buscar').click
    @browser.screenshot.save "./screenshots/#{Data_time}/ResultadoSLI.png"
  end
  
  Então("devo pesquisar por um item") do
    pesquisa = @browser.ul(class:['showcase-itens', 'clearfix', 'table-view']).h2s.select{|x| x.class_name == 'product-name'}[0..3].map{|x| x.text}
    puts pesquisa
    @browser.screenshot.save "./screenshots/#{Data_time}/PesquisaSLI.png"
    @browser.execute_script("window.scrollBy(0,100000)")
    @browser.screenshot.save "./screenshots/#{Data_time}/RodaPePagina.png"
  end