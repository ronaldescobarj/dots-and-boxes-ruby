require './lib/BoardFunctions'
require './lib/LineFunctions'
require './lib/Circle'

describe BoardFunctions do

    before(:each) do
        @board_functions= BoardFunctions.new
        @line_functions= LineFunctions.new
    end

    it "un tablero de tamanio 3 deberia devolver 9 circulos" do
        expect(@board_functions.generate_circles(3).size()).to eq 9
    end
    
    it "un tablero de tamanio 2 deberia devolver el tablero correspondiente" do
        circles = @board_functions.generate_circles(2)
        expect(circles[0]).to have_attributes(x: 100,y: 100)
        expect(circles[1]).to have_attributes(x: 200,y: 100)
        expect(circles[2]).to have_attributes(x: 100,y: 200)
        expect(circles[3]).to have_attributes(x: 200,y: 200)
    end

    it "un tablero de tamanio 2 deberia devolver 4 lineas" do
        expect(@board_functions.generate_lines(2).size()).to eq 4
    end
    
    it "un tablero de tamanio 2 deberia devolver el tablero correspondiente" do
        lines = @board_functions.generate_lines(2)
        expect(lines[0]).to have_attributes( x1:100 ,y1:100, x2:200, y2:100)
        expect(lines[1]).to have_attributes( x1:100 ,y1:200, x2:200, y2:200)
        expect(lines[2]).to have_attributes( x1:100 ,y1:100, x2:100, y2:200)
        expect(lines[3]).to have_attributes( x1:200 ,y1:100, x2:200, y2:200)
    end
    
    it "un tablero de tamanio 2 deberia devolver 4 marcas" do
        expect(@board_functions.generate_marks(2).size()).to eq 4
    end
    
    it "un tablero de tamanio 2 deberia devolver el tablero correspondiente" do
        marks = @board_functions.generate_marks(2)
        expect(marks[0]).to have_attributes(x: 150,y: 150)
        expect(marks[1]).to have_attributes(x: 250,y: 150)
        expect(marks[2]).to have_attributes(x: 150,y: 250)
        expect(marks[3]).to have_attributes(x: 250,y: 250)
    end

    it "si marco una linea con las coordenadas (100,100) y direccion vertical deberia de tener opacidad en 1" do
        lines = @board_functions.generate_lines(2)
        id = @line_functions.generate_id(100, 100, "vertical")
        @board_functions.mark_line(100, 100, "vertical", lines)
        new_opacity = 0.0
        lines.each do |line| 
            if line.id == id 
                new_opacity = line.opacity
            end
        end
        expect(new_opacity).to eq 1
    end
end