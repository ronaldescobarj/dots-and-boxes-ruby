Given("estoy en la vista del juego") do
    visit('/game')
end

When("pongo el palito en las coordenadas {string}, {string} con la direccion {string} y es el turno del jugador con el color {string} y hago clic en {string}") do |x, y, direccion, color, agregar|
  fill_in('x', with: x.to_i )
  fill_in('y', with: y.to_i)
  select direccion, :from => "direction"
  click_on(agregar)
end

Then("deberia ver el palito agregado en {string}, {string}") do |string, string2|
  expect(page.find("#l100_100_200_100")[:style]).to have_content("opacity: 1")
end

Then("con el color {string}") do |color|
  if color == "azul"
    color = "#354698"
  end
  expect(page.find("#l100_100_200_100")[:stroke]).to have_content("#354698")
end

Given("hay tres lineas que pueden formar un cuadrado") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("pongo el palito en las coordenadas {string}, {string} con la direccion {string} y es el turno del jugador con el color {string}, hago clic en {string}") do |string, string2, string3, string4, string5|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("deberia ver la marca en la posicion {string}, {string}, dentro del cuadrado formado") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

When("pongo el palito en las coordenadas {string}, {string} con la direccion {string} y es el turno del jugador con el color {string} hago clic en {string}") do |string, string2, string3, string4, string5|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("deberia seguir siendo el turno del jugador con el color {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Given("el puntaje inicial es {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("pongo el palito en las coordenadas {string}, {string} con la direccion {string} y es el turno del jugador con el color
{string} hago clic en {string}") do |string, string2, string3, string4, string5|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("deberia actualizarse el puntaje del jugador {string} a {string}") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end