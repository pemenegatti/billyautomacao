# encoding: utf-8 
require 'watir'
require 'rspec'

Data_time = Time.now.strftime("%Y%m%d-%H%M%S")

if Dir.exists?("screenshots")
  Dir.mkdir("./screenshots/#{Data_time}")
else
  Dir.mkdir("./screenshots")
  Dir.mkdir("./screenshots/#{Data_time}")
end
# o default do watir é o chrome, caso você queira iniciar com um outro tipo de browser é so passar após o .new :firefox
browser = Watir::Browser.new :chrome, headless: false
browser.driver.manage.window.maximize

Before do 
    # estamos setendo a referencia do browser para uma variavel global chama @browser
    @browser = browser
end    