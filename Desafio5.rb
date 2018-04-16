require 'watir'
Data_time = Time.now.strftime("%Y%m%d-%H%M%S")

if Dir.exists?("screenshots")
  Dir.mkdir("./screenshots/#{Data_time}")
else
  Dir.mkdir("./screenshots")
  Dir.mkdir("./screenshots/#{Data_time}")
end
browser = Watir::Browser.new
browser.driver.manage.window.maximize
browser.goto 'www.centauro.com.br'
browser.a(text:'Entre | Cadastre-se').click
browser.text_field(class:'box-TipoUser').set 'pedrotestescentauro@mailinator.com'
browser.input(id:'optYesclient').click
browser.text_field(name:'Senha').set '123'
browser.input(id:'btn_Entrar').click
logado = browser.ps(class: ['user-greeting-logout', 'login-name']).select{|e| e.visible?}.first.text.include? "Olá"
sleep 3
if logado == true
  puts 'Logado'
  browser.screenshot.save "./screenshots/#{Data_time}/Logado.png"
else
  puts 'Não Logado'
end
browser.text_field(class:'form-field').set 'anzol'
browser.button(title:'Buscar').click
browser.lis(class:['sli_grid_container']).first.click
browser.label(title:'Cor: BRANCO').click
browser.div(class:['holder', 'clearfix']).lis.select{|a| !a.span.class_name.match('Indisponivel') && !a.span.text.empty?}.sample.click
browser.button(class:['form-submitRed', 'large', 'buy', 'available']).click
produto = browser.td(class:['cell', 'product']).exists?
sleep 3
if produto == true
  puts 'Produto no carrinho'
  browser.execute_script("window.scrollBy(0,200)")
  browser.screenshot.save "./screenshots/#{Data_time}/Produto.png"
else
  puts 'Não há produto no carrinho'
end
browser.button(class:['form-submit', 'large', 'next-step', 'concluir-pedido-carrinho-novo']).click
sleep 10
telaEntrega = browser.div(class:['mirage', 'single']).exists?
if telaEntrega == true
  puts 'Você está na tela de entrega'
  browser.screenshot.save "./screenshots/#{Data_time}/TelaEntrega.png"
  browser.label(for:'Entregas[0].TipoEntrega-1').click
  tipoEntrega = browser.div(class:['iradio_minimal', 'checked']).input.attribute('id')
  if tipoEntrega == 'Entregas[0].TipoEntrega-1'
    puts 'Tipo Entrega Normal Selecionada'
    browser.screenshot.save "./screenshots/#{Data_time}/TipoEntrega.png"
  end
  browser.button(text:'Ir para o pagamento').click
  sleep 10
  browser.a(class:['item','boleto']).click
  sleep 10
  browser.buttons(class: ['form-submit', 'next-step']).select{|a| a.present?}.first.click
  pedidoRealizado = browser.div(class:['productList', 'productList-store',  'novo-checkout-nps']).exists?
  if pedidoRealizado == true
    puts "Seu pedido: #{browser.div(class:'txt-Numberorder-text').span.text}, foi realizado com sucesso!"
    browser.screenshot.save "./screenshots/#{Data_time}/PedidoRealizado.png"
  end
else
  puts 'Você não está na tela de entrega'
end
browser.a(id:'home').click
browser.text_field(class:'form-field').set 'cadarco'
browser.button(title:'Buscar').click
browser.screenshot.save "./screenshots/#{Data_time}/ResultadoSLI.png"
pesquisa = browser.ul(class:['showcase-itens', 'clearfix', 'table-view']).h2s.select{|x| x.class_name == 'product-name'}[0..3].map{|x| x.text}
puts pesquisa
browser.execute_script("window.scrollBy(0,100000)")
browser.screenshot.save "./screenshots/#{Data_time}/RodaPePagina.png"
sleep 5
