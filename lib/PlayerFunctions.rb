require_relative 'Player'

class PlayerFunctions

    def generate_players(names)
        players = []
        size = names.length
        colors = ["#354698", "#C42615", "#EAA81D", "#86B71B", "#7A3AB9"] 
        for i in 0..(size-1)
            players[i] = Player.new(names[i], colors[i], 0, "p" + i.to_s)
        end
        return players
    end

    def increase_score(player,formed_squares)
        for formed_square in formed_squares
            player.score += 100
        end
    end

    def sort_by_score(players)
        players.sort! {|player1, player2| player2.score <=> player1.score }
    end
end