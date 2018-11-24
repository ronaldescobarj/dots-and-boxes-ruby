When("abro el menu de {string}") do |boton|
    click_on(boton)
end

Then("deberia ver la opcion de {string}") do |opcion|
  expect(page).to have_content(opcion)
end