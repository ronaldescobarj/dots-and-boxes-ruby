Then("deberia ver el texto {string}") do |titulo|
    expect(page).to have_content(titulo)    
end