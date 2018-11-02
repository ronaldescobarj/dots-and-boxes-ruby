
Given("entro a la pagina principal") do
  visit('/mainMenu')
end

When("hago clic en {string}") do |string|
  click_on(string)
end

Then("deberia ver el {string}") do |string|
  expect(page).to have_content(string)
end

Then("deberia ver {string} y {string}") do |string, string2|
  expect(page).to have_content(string)
  expect(page).to have_content(string2)
end

Then("deberia ver {string}") do |string|
  expect(page).to have_content(string)
end