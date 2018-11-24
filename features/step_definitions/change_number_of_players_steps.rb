Then("deberia ver todas las opciones de cantidad de jugadores disponibles en un menu desplegable") do
    expect(page).to have_select("players", :options => ["2","3", "4"])
end

