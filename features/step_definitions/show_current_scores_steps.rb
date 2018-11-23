When("el jugador uno {string} formo un cuadrado") do |string|
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
end

When("el jugador dos {string} tiene {string}") do |string, string2|
  fill_in('x', with: 4)
  fill_in('y', with: 1)
  select "Vertical", :from => "direction"
  click_on("Agregar")
end

Then("deberia ver primero a {string} y luego a {string}") do |jugador1, jugador2|
  expect(page).to have_content("1. " + jugador1)
  expect(page).to have_content("2. " + jugador2)
end