Dado("que estou na home") do
    @browser.goto 'www.centauro.com.br'
  end
  
  Quando("realizao uma pesquisa") do
    @browser.text_field(class:'form-field').set 'cadarco'
    @browser.button(title:'Buscar').click
    @browser.screenshot.save "./screenshots/#{Data_time}/ResultadoSLI.png"
  end
  
  Quando("listo os nomes dos quatros primeiros produtos") do 
    pesquisa = @browser.ul(class:['showcase-itens', 'clearfix', 'table-view']).h2s.select{|x| x.class_name == 'product-name'}[0..3].map{|x| x.text}
    puts pesquisa
  end
  
  Quando("tiro um print screen dos quatros primeiros produtos") do
    @browser.screenshot.save "./screenshots/#{Data_time}/PesquisaSLI.png"
  end
  
  Quando("realizo um scroll ate o rodapé da pagina") do
    @browser.execute_script("window.scrollBy(0,100000)")
  end
  
  Então("tira um print screen do rodapé da pagina") do
    @browser.screenshot.save "./screenshots/#{Data_time}/RodaPePagina.png"
  end