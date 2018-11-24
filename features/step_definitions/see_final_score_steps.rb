Given("la partida actual termino") do
  visit('/mainMenu')
  fill_in('player1', with: "Laura")
  fill_in('player2', with: "Andrea")
  select "3x3", :from => "sizes"
  click_on("Jugar")

  fill_in('x', with: 1)
  fill_in('y', with: 1)
  select "Horizontal", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 1)
  fill_in('y', with: 1)
  select "Vertical", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 2)
  fill_in('y', with: 1)
  select "Vertical", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 1)
  fill_in('y', with: 2)
  select "Horizontal", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 2)
  fill_in('y', with: 1)
  select "Horizontal", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 3)
  fill_in('y', with: 1)
  select "Vertical", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 2)
  fill_in('y', with: 2)
  select "Horizontal", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 2)
  fill_in('y', with: 2)
  select "Vertical", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 1)
  fill_in('y', with: 2)
  select "Vertical", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 1)
  fill_in('y', with: 3)
  select "Horizontal", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 2)
  fill_in('y', with: 3)
  select "Horizontal", :from => "direction"
  click_on("Agregar")

  fill_in('x', with: 3)
  fill_in('y', with: 2)
  select "Vertical", :from => "direction"
  click_on("Agregar")
end

When("presiono el boton {string}") do |boton|
  click_on(boton)
end

Then("deberia ver en primer lugar a {string} y en segundo a {string}") do |jugador2, jugador1|
  expect(page).to have_content("1. " + jugador2)
  expect(page).to have_content("2. " + jugador1)
end

Then("deberia ver que gano {string}") do |ganador|
  expect(page).to have_content("Ganador: " + ganador)
end