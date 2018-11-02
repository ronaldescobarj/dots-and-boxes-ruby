require 'sinatra'
require './lib/Circle'
require './lib/Line'

class App < Sinatra::Base

    get '/mainMenu' do
        erb :mainMenu
    end

    get '/game' do
        @circles = []
        @lines = []
        for i in 1..5
            for j in 1..5
                circle = Circle.new(100*j, 50*i, 10)
                @circles.push(circle)
            end
        end

        counter = 1

        for i in 1..5
            for j in 1..4
                line = Line.new(100*j, 50*i, 100*(j+1), 50*i, counter)
                counter += 1
                @lines.push(line)
            end
        end
        for i in 1..4
            for j in 1..5
                line = Line.new(100*j, 50*i, 100*j, 50*(i+1), counter)
                counter += 1
                @lines.push(line)
            end
        end
        erb :game
    end
    
    run! if app_file == $0;

end