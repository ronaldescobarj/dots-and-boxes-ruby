require 'sinatra'
class App < Sinatra::Base
    get '/mainMenu' do
        erb :mainMenu
    end

    get '/game' do
        erb :game
    end
    
    run! if app_file == $0;
end