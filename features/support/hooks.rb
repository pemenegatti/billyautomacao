# coding: utf-8
require 'json'

After do |scenario|
    @browser.cookies.clear rescue warn 'Sem sessão para limpar'
    puts "O cenário terminou em: #{DateTime.now}"
end