When("selecciono {int} jugadores") do |numero_jugadores|
    select numero_jugadores, :from => "players"
end

When("ingreso los tres nombres") do
    fill_in('player1', with: "Juan")
    fill_in('player2', with: "Andres")    
end

Then("deberia ver el nombre de {string} y {string} dentro de la partida") do |jugador1, jugador2|
    expect(page).to have_content("1. " + jugador1)
    expect(page).to have_content("2. " + jugador2)
end