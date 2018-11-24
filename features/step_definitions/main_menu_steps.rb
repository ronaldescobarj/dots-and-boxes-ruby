require '././lib/BoardFunctions'

Given("entro a la pagina principal") do
  visit('/mainMenu')
end

When("hago clic en {string}") do |jugar|
  click_on(jugar)
end

Then("deberia ver el tablero vacio") do
  board_functions = BoardFunctions.new
  lines = board_functions.generate_lines(5)
  marks = board_functions.generate_marks(5)
  for line in lines
    expect(page.find("#" + line.id)[:style]).to have_content("opacity: 0.3")    
  end
  for mark in marks
    expect(page.find("#" + mark.id)[:style]).to have_content("opacity: 0")    
  end
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