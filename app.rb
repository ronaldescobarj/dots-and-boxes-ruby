require 'sinatra'
require './lib/Circle'
require './lib/Line'
require './lib/Player'

class App < Sinatra::Base

    get '/mainMenu' do
        erb :mainMenu
    end

    get '/game' do
        @circles = []
        @lines = []
        @marks = []
        @players = []
        player = Player.new("Jugador 1", 0, "p1")
        @players.push(player)
        player = Player.new("Jugador 2", 0, "p2")
        @players.push(player)
        for i in 1..5
            for j in 1..5
                circle = Circle.new(100*j, 100*i, 10,0)
                @circles.push(circle)
            end
        end
        for i in 1..5
            for j in 1..4
                lineId = "l" + (100*j).to_s + "_" + (100*i).to_s + "_" + (100*(j+1)).to_s + "_" + (100*i).to_s
                line = Line.new(100*j, 100*i, 100*(j+1), 100*i, lineId)
                @lines.push(line)
            end
        end
        for i in 1..4
            for j in 1..5
                lineId = "l" + (100*j).to_s + "_" + (100*i).to_s + "_" + (100*j).to_s + "_" + (100*(i+1)).to_s
                line = Line.new(100*j, 100*i, 100*j, 100*(i+1), lineId)
                @lines.push(line)
            end
        end
        for i in 1..4
            for j in 1..4
                lineId = "l" + ((100*j)+50).to_s + "_" + ((100*i)+50).to_s
                circle = Circle.new((100*j)+50, (100*i)+50, 7, lineId)
                @marks.push(circle)
            end
        end
    

        erb :game
    end
    
    run! if app_file == $0;

end