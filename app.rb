require 'sinatra'
require './lib/Circle'
require './lib/Line'
require './lib/BoardFunctions'

class App < Sinatra::Base

    $board_functions = BoardFunctions.new
    $circles_global = $board_functions.generate_circles(5)
    $lines_global = $board_functions.generate_lines(5)
    $marks_global = $board_functions.generate_marks(5)

    get '/mainMenu' do
        erb :mainMenu
    end

    get '/game' do
        @circles = $circles_global
        @lines = $lines_global
        @marks = $marks_global
        erb :game
    end
    
    run! if app_file == $0;

end