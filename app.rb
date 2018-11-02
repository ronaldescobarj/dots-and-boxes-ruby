require 'sinatra'
class App < Sinatra::Base
    get '/' do
        "hola"
    end
end