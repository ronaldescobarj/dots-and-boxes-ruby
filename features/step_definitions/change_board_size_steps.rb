require '././lib/BoardFunctions'

Then("deberia ver todas las opciones de tamaños disponibles en un menu desplegable") do
    expect(page).to have_select("sizes", :options => ["3x3","4x4", "5x5", "6x6", "7x7", "8x8"])
end

When("selecciono un tamaño {string}") do |tam|
    select tam, :from => "sizes"
end

Then("deberia ver el tablero con el tamaño {string}") do |tam|
    board_functions = BoardFunctions.new
    lines = board_functions.generate_lines(tam.to_i)
    for line in lines
        expect(page.find("#" + line.id)[:style]).to have_content("opacity: 0.3")    
    end
end