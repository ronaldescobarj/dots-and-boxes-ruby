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

    def increase_score(player)
        player.score += 100
    end
end