Dado("que estou na tela de login") do
    @browser.goto 'www.centauro.com.br'
    @browser.a(text:'Entre | Cadastre-se').click
  end
  
  Quando("tento fazer um login com um usuário Válido") do
    @browser.text_field(class:'box-TipoUser').set 'pedrotestescentauro@mailinator.com'
    @browser.input(id:'optYesclient').click
    @browser.text_field(name:'Senha').set '123'
    @browser.input(id:'btn_Entrar').click
  end
  
  Então("devo me logar") do
    logado = @browser.ps(class: ['user-greeting-logout', 'login-name']).select{|e| e.visible?}.first.text.include? "Olá"
  end