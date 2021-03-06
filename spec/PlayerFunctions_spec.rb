require './lib/PlayerFunctions'

describe PlayerFunctions do

    before(:each) do
        @player_functions= PlayerFunctions.new
        @names = ["Ximena", "Pepe"]
        @players = @player_functions.generate_players(@names)
    end

    it "al iniciar deberia devolver una lista de tamaño 5 para una partida de 5 jugadores" do
        expect(@player_functions.generate_players(["Juan", "Pepe", "Laura", "Fer", "Rodrigo"]).length).to eq 5
    end

    it "al iniciar deberia devolver los dos jugadores correspondientes para los nombres correspondientes" do
        expect(@players[0]).to have_attributes(name: "Ximena")
        expect(@players[1]).to have_attributes(name: "Pepe")
    end

    it "al iniciar deberia devolver los dos jugadores con los scores en 0" do
        expect(@players[0]).to have_attributes(score: 0)
        expect(@players[1]).to have_attributes(score: 0)
    end

    it "al iniciar deberia devolver los dos jugadores con sus ids correspondientes" do
        expect(@players[0]).to have_attributes(id: "p0")
        expect(@players[1]).to have_attributes(id: "p1")
    end

    it "al iniciar deberia devolver los dos jugadores con los colores correspondientes" do
        colors = ["#354698", "#C42615", "#EAA81D", "#86B71B", "#7A3AB9"] 
        expect(@players[0]).to have_attributes(color: colors[0])
        expect(@players[1]).to have_attributes(color: colors[1])
    end

    it "no deberia aumentar el puntaje sino se forma un cuadrado" do
        player_score = @players[0].score
        formed_squares = []
        @player_functions.increase_score(@players[0], formed_squares)
        expect(@players[0].score).to eq player_score
    end

    it "deberia aumentar el puntaje en 100 si se forma un cuadrado" do
        player_score = @players[0].score
        formed_squares = ["up"]
        @player_functions.increase_score(@players[0], formed_squares)
        expect(@players[0].score).to eq player_score+100
    end

    it "deberia aumentar el puntaje en 200 si se forma un cuadrado" do
        player_score = @players[0].score
        formed_squares = ["up", "down"]
        @player_functions.increase_score(@players[0], formed_squares)
        expect(@players[0].score).to eq player_score+200
    end

    it "deberian ordenarse los jugadores por puntaje" do
        @players[1].score = 100
        @player_functions.sort_by_score(@players)
        expect(@players[0].name).to eq "Pepe"
        expect(@players[1].name).to eq "Ximena"
    end

    it "deberian reiniciarse todos los puntajes a 0" do
        @players[0].score = 100
        @players[1].score = 100
        @player_functions.reset_scores(@players)
        expect(@players[0].score).to eq 0
        expect(@players[1].score).to eq 0

    end
end
