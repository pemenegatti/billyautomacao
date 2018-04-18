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
    
  Dado(/^que estou logado$/) do
    steps %{
      Dado que estou na tela de login
      Quando tento fazer um login com um usuário Válido
      Então devo me logar
   }
end