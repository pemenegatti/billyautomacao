# encoding: utf-8 
require 'watir'
require 'rspec'

# o default do watir é o chrome, caso você queira iniciar com um outro tipo de browser é so passar após o .new :firefox
browser = Watir::Browser.new
browser.driver.manage.window.maximize

Before do 
    # estamos setendo a referencia do browser para uma variavel global chama @browser
    @browser = browser
end    