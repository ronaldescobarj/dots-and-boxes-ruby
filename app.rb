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
        @max = 4
        @size = 5
        erb :game
    end

    post '/game' do
        $board_functions.mark_line(params[:x].to_i * 100, params[:y].to_i * 100, params[:direction], $lines_global)
        redirect "/game"
    end
    
    run! if app_file == $0;

end