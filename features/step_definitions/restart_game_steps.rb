Given("hago una jugada") do
    fill_in('x', with: 2)
    fill_in('y', with: 1)
    select "Vertical", :from => "direction"
    click_on("Agregar")
end