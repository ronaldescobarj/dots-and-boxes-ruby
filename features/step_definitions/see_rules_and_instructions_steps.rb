Then("deberia ver el encabezado {string}") do |encabezado|
    expect(page).to have_content(encabezado)
end