require './lib/PlayerFunctions'

describe PlayerFunctions do

    before(:each) do
        @player_functions= PlayerFunctions.new
    end

    it "deberia devolver una lista de tamaño 5 para una partida de 5 jugadores" do
        expect(@player_functions.generate_players(["Juan", "Pepe", "Laura", "Fer", "Rodrigo"]).length).to eq 5
    end

    it "deberia devolver los dos jugadores correspondientes para los nombres correspondientes" do
        names = ["Ximena", "Pepe"]
        players = @player_functions.generate_players(names)
        expect(players[0]).to have_attributes(name: "Ximena")
        expect(players[1]).to have_attributes(name: "Pepe")
    end

    it "deberia devolver los dos jugadores con sus scores correspondientes" do
        names = ["Ximena", "Pepe"]
        players = @player_functions.generate_players(names)
        expect(players[0]).to have_attributes(score: 0)
        expect(players[1]).to have_attributes(score: 0)
    end

    it "deberia devolver los dos jugadores con sus ids correspondientes" do
        names = ["Ximena", "Pepe"]
        players = @player_functions.generate_players(names)
        expect(players[0]).to have_attributes(id: "p0")
        expect(players[1]).to have_attributes(id: "p1")
    end

    it "deberia devolver los dos jugadores con los colores correspondientes" do
        names = ["Ximena", "Pepe"]
        colors = ["#354698", "#C42615", "#EAA81D", "#86B71B", "#7A3AB9"] 
        players = @player_functions.generate_players(names)
        expect(players[0]).to have_attributes(color: colors[0])
        expect(players[1]).to have_attributes(color: colors[1])
    end
end
