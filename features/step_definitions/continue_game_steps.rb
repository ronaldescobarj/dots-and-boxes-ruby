Then("deberia ver el tablero tal y como lo deje antes de hacer pausa") do
    $line_id = $line_functions.generate_id(200, 100, "vertical")
    expect(page.find("#" + $line_id)[:style]).to have_content("opacity: 1")
end