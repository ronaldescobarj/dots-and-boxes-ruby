require '././lib/LineFunctions'

$line_functions = LineFunctions.new
$line_id = ""
$mark_id = ""

def get_color(color)
  if color == "azul"
    color = "#354698"
  end
  if color == "rojo"
    color = "#C42615"
  end
  return color
end

When("pongo el palito en las coordenadas {string}, {string} con la direccion {string} y es el turno del jugador con el color {string} y hago clic en {string}") do |x, y, direccion, color, agregar|
  fill_in('x', with: x.to_i)
  fill_in('y', with: y.to_i)
  select direccion, :from => "direction"
  click_on(agregar)
end

Then("deberia ver el palito agregado en {string}, {string} con direccion {string}") do |x, y, direccion|
  $line_id = $line_functions.generate_id(x.to_i*100, y.to_i*100, direccion)
  expect(page.find("#" + $line_id)[:style]).to have_content("opacity: 1")
end

Then("con el color {string}") do |color|
  color = get_color(color)
  expect(page.find("#" + $line_id)[:stroke]).to have_content(color)
end

Given("hay tres lineas que pueden formar un cuadrado") do
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
end

Then("deberia ver la marca en la posicion {string}, {string}") do |x, y|
  $mark_id = $line_functions.generate_mark_id((x.to_f*100).to_i, (y.to_f*100).to_i)
  expect(page.find("#" + $mark_id)[:style]).to have_content("opacity: 1")
end

Then("con el color {string} dentro del cuadrado formado") do |color|
  color = get_color(color)  
  expect(page.find("#" + $mark_id)[:stroke]).to have_content(color)
end

Then("deberia seguir siendo el turno del jugador con el nombre {string}") do |nombre|
  expect(page).to have_content("Turno de: " + nombre)
end

Then("deberia actualizarse el puntaje del jugador {string} en {string}") do |jugador, puntaje|
  expect(page).to have_content(jugador + ": " + puntaje)
end