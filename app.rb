require 'sinatra'
require './lib/Circle'
require './lib/Line'
require './lib/BoardFunctions'
require './lib/LineFunctions'
require './lib/PlayerFunctions'
require 'rubygems'

class App < Sinatra::Base

    $board_functions = BoardFunctions.new
    $line_functions = LineFunctions.new
    $player_functions = PlayerFunctions.new
    $circles_global = $board_functions.generate_circles(5)
    $lines_global = $board_functions.generate_lines(5)
    $marks_global = $board_functions.generate_marks(5)
    $players = $player_functions.generate_players(["Player1", "Player2"])
    $number_of_players = 2
    $showable_players = $players.clone
    $current_turn = 0
    $size = 5
    $game_over = false


    def validate_positions(x, y, direction)
        if direction == "horizontal"
            return x<$size && y<=$size && x>0 && y>0
        else
            return x<=$size && y<$size && x>0 && y>0
        end
    end

    def reset()
        $circles_global = $board_functions.generate_circles(5)
        $lines_global = $board_functions.generate_lines(5)
        $marks_global = $board_functions.generate_marks(5)
        $player_functions.reset_scores($players)
        $current_turn = 0
    end

    def reset_players()
        $showable_players = $players.clone
    end

    get '/' do
        redirect '/mainMenu'
    end

    get '/mainMenu' do
        reset()
        reset_players()
        @number_of_players = $number_of_players
        erb :main_menu
    end

    get '/game' do
        @circles = $circles_global
        @lines = $lines_global
        @marks = $marks_global
        @size = $size
        @current_turn = $current_turn
        @players = $players
        @showable_players = $showable_players
        @game_over = $game_over
        erb :game
    end

    get '/finalScores' do
        @showable_players = $players.clone
        $player_functions.sort_by_score(@showable_players)
        erb :final_scores
    end

    post '/game' do
        $size = params[:sizes].to_i
        $circles_global = $board_functions.generate_circles($size)
        $lines_global = $board_functions.generate_lines($size)
        $marks_global = $board_functions.generate_marks($size)
        players = []
        if $number_of_players.to_i >= 2
            players.push(params[:player1])
            players.push(params[:player2])
        end
        if $number_of_players.to_i >= 3
            players.push(params[:player3])
        end
        if $number_of_players.to_i >= 4
            players.push(params[:player4])
        end
        $players = $player_functions.generate_players(players)
        $showable_players = $players.clone
        redirect '/game'
    end

    post '/addLine' do
        if validate_positions(params[:x].to_i, params[:y].to_i, params[:direction])
            line_id = $line_functions.generate_id(params[:x].to_i * 100, params[:y].to_i * 100, params[:direction])
            if ! $board_functions.is_line_marked(line_id, $lines_global)
                $board_functions.mark_line(line_id, $lines_global, $current_turn)
                formed_squares = $board_functions.get_directions_of_formed_squares($lines_global, line_id, $size)
                $board_functions.make_marks_visible(formed_squares, $marks_global, line_id, $current_turn)
                no_new_squares_formed = formed_squares.empty?
                $player_functions.increase_score($players[$current_turn], formed_squares)
                $showable_players = $players.clone
                $current_turn = $board_functions.get_current_turn($current_turn, no_new_squares_formed, $players)
                $player_functions.sort_by_score($showable_players)
                if $board_functions.is_game_over($lines_global)
                    $game_over = true
                end
            end
        end
        redirect "/game"
    end

    post '/numberOfPlayers' do
        $number_of_players = params[:players]
        redirect "/mainMenu"
    end

    get '/reset' do
        reset()
        redirect '/game'
    end
    
    run! if app_file == $0;

end