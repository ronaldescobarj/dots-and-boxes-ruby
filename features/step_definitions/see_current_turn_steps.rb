When("el jugador uno {string} hizo una jugada") do |string|
    fill_in('x', with: 1)
    fill_in('y', with: 1)
    select "Horizontal", :from => "direction"
    click_on("Agregar")
end

Then("deberia ser el turno de {string}") do |jugador|
  expect(page).to have_content("Turno de: " + jugador)
end