
Given("entro a la pagina principal") do
  visit('/mainMenu')
end

When("hago clic en {string}") do |jugar|
  click_on(jugar)
end

Then("deberia ver el {string}") do |titulo_del_juego|
  expect(page).to have_content(titulo_del_juego)
end

Then("deberia ver el primer jugador {string} con el puntaje {string}") do |jugador, puntaje|
  expect(page).to have_content(jugador + ": " + puntaje)
end

Then("deberia ver el segundo jugador {string} con el puntaje {string}") do |jugador, puntaje|
    expect(page).to have_content(jugador + ": " + puntaje)
end

Then("deberia ver que es el turno de {string}") do |jugador|
  expect(page).to have_content("Turno de: " + jugador)
end