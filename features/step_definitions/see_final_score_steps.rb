Given("la partida actual termino") do
  visit('/mainMenu')
  click_on("Jugar")

  fill_in('x', with: 2)
  fill_in('y', with: 1)
  select "Vertical", :from => "direction"
  click_on("Agregar")
  fill_in('x', with: 1)
  fill_in('y', with: 1)
  select "Vertical", :from => "direction"
  click_on("Agregar")
  fill_in('x', with: 1)
  fill_in('y', with: 2)
  select "Horizontal", :from => "direction"
  click_on("Agregar")
  fill_in('x', with: 1)
  fill_in('y', with: 1)
  select "Horizontal", :from => "direction"
  click_on("Agregar")

  visit("/finalScores")
end

Then("deberia ver en primer lugar a {string} y en segundo a {string}") do |jugador1, jugador2|
  expect(page).to have_content("1. " + jugador1)
  expect(page).to have_content("2. " + jugador2)
end

Then("deberia ver que gano {string}") do |ganador|
  expect(page).to have_content("Ganador: " + ganador)
end