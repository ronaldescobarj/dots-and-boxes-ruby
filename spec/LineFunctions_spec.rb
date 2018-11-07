require './lib/LineFunctions'

describe LineFunctions do

    before(:each) do
        @line_functions= LineFunctions.new()
    end

    it "deberia devolver l100_100_200_100 para las coordenadas 100,100 200,100" do
        expect(@line_functions.generate_id_string(100,100,200,100)).to eq "l100_100_200_100"
    end

    it "deberia devolver l100_100_200_100 para las coordenadas 100,100 con direccion horizontal" do
        expect(@line_functions.generate_id_horizontal(100,100)).to eq "l100_100_200_100"
    end

    it "deberia devolver l100_100_100_200 para las coordenadas 100,100 con direccion vertical" do
        expect(@line_functions.generate_id_vertical(100,100)).to eq "l100_100_100_200"
    end

    it "deberia devolver l100_100_100_200 para las coordenadas 100,100 pasandole como atributo vertical" do
        expect(@line_functions.generate_id(100,100,"vertical")).to eq "l100_100_100_200"
    end

    it "deberia devolver l100_100_200_100 para las coordenadas 100,100 pasandole como atributo horizontal" do
        expect(@line_functions.generate_id(100,100,"horizontal")).to eq "l100_100_200_100"
    end

end 