When("agrego {int} palitos") do |int|
  fill_in('x', with: 1)
  fill_in('y', with: 1)
  select "Horizontal", :from => "direction"
  click_on("Agregar")
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
  fill_in('x', with: 4)
  fill_in('y', with: 1)
  select "Vertical", :from => "direction"
  click_on("Agregar")
end

Then("deberia ver todos los palitos agregados con los colores respectivos") do
    blue = "#354698"
    red = "#C42615"
    expect(page.find("#l100_100_200_100")[:style]).to have_content("opacity: 1")
    expect(page.find("#l100_100_200_100")[:stroke]).to have_content(blue)

    expect(page.find("#l200_100_200_200")[:style]).to have_content("opacity: 1")
    expect(page.find("#l200_100_200_200")[:stroke]).to have_content(red)

    expect(page.find("#l100_100_100_200")[:style]).to have_content("opacity: 1")
    expect(page.find("#l100_100_100_200")[:stroke]).to have_content(blue)
    
    expect(page.find("#l100_200_200_200")[:style]).to have_content("opacity: 1")
    expect(page.find("#l100_200_200_200")[:stroke]).to have_content(red)

    expect(page.find("#l400_100_400_200")[:style]).to have_content("opacity: 1")
    expect(page.find("#l400_100_400_200")[:stroke]).to have_content(red)
    
end

Then("deberia ver todas las marcas ganadas con los colores respectivos") do
    red = "#C42615"
    expect(page.find("#l150_150")[:style]).to have_content("opacity: 1")
    expect(page.find("#l150_150")[:stroke]).to have_content(red)
    expect(page.find("#l150_150")[:fill]).to have_content(red)

end
