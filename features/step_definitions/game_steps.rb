Given("la vista de juego") do
  visit('/game')
end

When("se hace clic en un palito transparente") do
  click_on(find_by_id("l100_100_200_100"))
end

Then("se marca el palito") do
    page.find("#l100_100_200_100")
    expect(find_by_id("l100_100_200_100")).to 
end