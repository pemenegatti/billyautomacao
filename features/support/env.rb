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
  # Firefox
  firefoxdriver_path = 'browsers/geckodriver.exe'
  raise "Cannot found FirefoxDriver on #{firefoxdriver_path}" if !File.file?(firefoxdriver_path)
  Selenium::WebDriver::Firefox.driver_path = firefoxdriver_path

  # Chrome
  chromedriver_path = 'browsers/chromedriver.exe'
  raise "Cannot found ChromeDriver on #{chromedriver_path}" if !File.file?(chromedriver_path)
  Selenium::WebDriver::Chrome.driver_path = chromedriver_path

headless = false
if (ENV['HEADLESS'] == 'true')
    headless = true
end  
# o default do watir é o chrome, caso você queira iniciar com um outro tipo de browser é so passar após o .new :firefox
browser = Watir::Browser.new ENV['BROWSER'].to_sym, headless: headless
browser.driver.manage.window.maximize

Before do 
    # estamos setendo a referencia do browser para uma variavel global chama @browser
    @browser = browser
end

at_exit do
  browser.cookies.clear
  browser.close
end