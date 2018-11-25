require './lib/BoardFunctions'
require './lib/LineFunctions'
require './lib/PlayerFunctions'
require './lib/Circle'
require './lib/Line'
require "ostruct"

describe BoardFunctions do

    before(:each) do
        @board_functions= BoardFunctions.new
        @line_functions= LineFunctions.new
        @player_functions= PlayerFunctions.new
    end

    it "un tablero de tamanio 3 deberia devolver 9 circulos" do
        expect(@board_functions.generate_circles(3).size()).to eq 9
    end
    
    it "un tablero de tamanio 2 deberia devolver las coordenadas de los 4 circulos correspondientes" do
        circles = @board_functions.generate_circles(2)
        expect(circles[0]).to have_attributes(x: 100,y: 100)
        expect(circles[1]).to have_attributes(x: 200,y: 100)
        expect(circles[2]).to have_attributes(x: 100,y: 200)
        expect(circles[3]).to have_attributes(x: 200,y: 200)
    end

    it "un tablero de tamanio 2 deberia generar 2 lineas horizontales" do
        expect(@board_functions.generate_horizontal_lines(2).size()).to eq 2
    end

    it "un tablero de tamanio 2 deberia devolver las coordenadas de las 2 lineas horizontales correspondientes" do
        horizontal_lines = @board_functions.generate_horizontal_lines(2)
        expect(horizontal_lines[0]).to have_attributes(x1: 100, y1: 100, x2: 200, y2: 100)
        expect(horizontal_lines[1]).to have_attributes(x1: 100, y1: 200, x2: 200, y2: 200)
    end

    it "un tablero de tamanio 2 deberia devolver 2 lineas verticales" do
        expect(@board_functions.generate_vertical_lines(2).size()).to eq 2
    end

    it "un tablero de tamanio 2 deberia devolver las coordenadas de las 2 lineas verticales correspondientes" do
        vertical_lines = @board_functions.generate_vertical_lines(2)
        expect(vertical_lines[0]).to have_attributes(x1: 100, y1: 100, x2: 100, y2: 200)
        expect(vertical_lines[1]).to have_attributes(x1: 200, y1: 100, x2: 200, y2: 200)
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
    
    it "un tablero de tamanio 2 deberia devolver las marcas con las coordenadas correspondientes" do
        marks = @board_functions.generate_marks(2)
        expect(marks[0]).to have_attributes(x: 150,y: 150)
        expect(marks[1]).to have_attributes(x: 250,y: 150)
        expect(marks[2]).to have_attributes(x: 150,y: 250)
        expect(marks[3]).to have_attributes(x: 250,y: 250)
    end

    it "el turno deberia cambiarse de 1 a 2" do
        current_turn = 1
        players = @player_functions.generate_players(["Laura", "Paola", "Marcos"])
        expect(@board_functions.next_turn(current_turn, players)).to eq 2
    end

    it "el turno deberia cambiarse de 2 a 0" do
        current_turn = 2
        players = @player_functions.generate_players(["Laura", "Paola", "Marcos"])
        expect(@board_functions.next_turn(current_turn, players)).to eq 0
    end

    it "la opacidad de una marca debe volverse 1" do
        gray = "#7f7f7f"
        mark = Circle.new(100, 100, 7, "id", gray, 0)
        expect(@board_functions.modify_opacity(mark)).to have_attributes(opacity: 1)
    end

    it "el color de una marca deberia volverse azul" do
        blue = "#354698"
        mark = Circle.new(100, 100, 7, "id", blue, 0)
        expect(@board_functions.modify_color(mark, blue)).to have_attributes(color: blue)
    end

    it "si tres vecinos estan marcados deberia devolver true" do
        gray = "#7f7f7f"
        line_one = Line.new(100,100,200,100,"l100_100_200_100",gray,1)
        line_two = Line.new(100,100,100,200,"l100_100_100_200",gray,1)
        line_three = Line.new(100,200,200,200,"l100_200_200_200",gray,1)
        lines = [line_one,line_two,line_three]
        neighbor_lines = [line_one.id, line_two.id, line_three.id]
        expect(@board_functions.all_neighbor_lines_are_filled(neighbor_lines, lines)).to eq true
    end

    it "si solamente dos vecinos estan marcados deberia devolver false" do
        gray = "#7f7f7f"
        line_one = Line.new(100,100,200,100,"l100_100_200_100",gray,0.3)
        line_two = Line.new(100,100,100,200,"l100_100_100_200",gray,1)
        line_three = Line.new(100,200,200,200,"l100_200_200_200",gray,1)
        lines = [line_one,line_two,line_three]
        neighbor_lines = [line_one.id, line_two.id, line_three.id]
        expect(@board_functions.all_neighbor_lines_are_filled(neighbor_lines, lines)).to eq false
    end

    it "cuando se forme un cuadrado la marca correspondiente deberia poder verse" do
        marks = @board_functions.generate_marks(3)
        line_id = "l100_200_200_200"
        current_turn = 0
        current_turn_color = "#354698"
        formed_squares = ["up"]
        @board_functions.make_marks_visible(formed_squares, marks, line_id, current_turn)
        expect(marks[0]).to have_attributes(color: current_turn_color, opacity: 1)
    end

    it "cuando se formen dos cuadrados con un solo palito las marcas correspondientes deberian poder verse" do
        marks = @board_functions.generate_marks(3)
        line_id = "l100_200_200_200"
        current_turn = 0
        current_turn_color = "#354698"
        formed_squares = ["up", "down"]
        @board_functions.make_marks_visible(formed_squares, marks, line_id, current_turn)
        expect(marks[0]).to have_attributes(color: current_turn_color, opacity: 1)
    end

    it "deberia devolver que todos los vecinos inferiores de una linea horizontal estan marcados" do
        coords = OpenStruct.new
        coords.x1 = 100
        coords.y1 = 100
        coords.x2 = 200
        coords.y2 = 100
        lines = @board_functions.generate_lines(2)
        lines.map do |l|
            l.opacity = 1
        end
        expect(@board_functions.are_downside_neighbor_lines_filled(coords, lines)).to eq true
    end 

    it "deberia devolver que todos los vecinos inferiores de una linea horizontal no estan marcados" do
        coords = OpenStruct.new
        coords.x1 = 100
        coords.y1 = 100
        coords.x2 = 200
        coords.y2 = 100
        lines = @board_functions.generate_lines(2)
        expect(@board_functions.are_downside_neighbor_lines_filled(coords, lines)).to eq false
    end 

    it "deberia devolver que todos los vecinos superiores de una linea horizontal estan marcados" do
        coords = OpenStruct.new
        coords.x1 = 100
        coords.y1 = 200
        coords.x2 = 200
        coords.y2 = 200
        lines = @board_functions.generate_lines(2)
        lines.map do |l|
            l.opacity = 1
        end
        expect(@board_functions.are_upside_neighbor_lines_filled(coords, lines)).to eq true
    end 
    
    it "deberia devolver que todos los vecinos superiores de una linea horizontal no estan marcados" do
        coords = OpenStruct.new
        coords.x1 = 100
        coords.y1 = 200
        coords.x2 = 200
        coords.y2 = 200
        lines = @board_functions.generate_lines(2)
        expect(@board_functions.are_upside_neighbor_lines_filled(coords, lines)).to eq false
    end

    it "deberia devolver que todos los vecinos derechos de una linea vertical estan marcados" do
        coords = OpenStruct.new
        coords.x1 = 100
        coords.y1 = 100
        coords.x2 = 100
        coords.y2 = 200
        lines = @board_functions.generate_lines(2)
        lines.map do |l|
            l.opacity = 1
        end
        expect(@board_functions.are_right_neighbor_lines_filled(coords, lines)).to eq true
    end 
    
    it "deberia devolver que todos los vecinos derechos de una linea vertical no estan marcados" do
        coords = OpenStruct.new
        coords.x1 = 100
        coords.y1 = 100
        coords.x2 = 100
        coords.y2 = 200
        lines = @board_functions.generate_lines(2)
        expect(@board_functions.are_right_neighbor_lines_filled(coords, lines)).to eq false
    end

    it "deberia devolver que todos los vecinos izquierdos de una linea vertical estan marcados" do
        coords = OpenStruct.new
        coords.x1 = 200
        coords.y1 = 100
        coords.x2 = 200
        coords.y2 = 200
        lines = @board_functions.generate_lines(2)
        lines.map do |l|
            l.opacity = 1
        end
        expect(@board_functions.are_left_neighbor_lines_filled(coords, lines)).to eq true
    end

    it "deberia devolver que todos los vecinos izquierdos de una linea vertical no estan marcados" do
        coords = OpenStruct.new
        coords.x1 = 200
        coords.y1 = 100
        coords.x2 = 200
        coords.y2 = 200
        lines = @board_functions.generate_lines(2)
        expect(@board_functions.are_left_neighbor_lines_filled(coords, lines)).to eq false
    end

    it "deberia devolver un objeto con coordenadas 100,100,200,100" do
        line_id = "l100_100_200_100"
        expect(@board_functions.generate_coords(line_id)).to have_attributes(x1: 100, y1: 100, x2: 200, y2: 100)
    end

    it "deberia devolver true si la linea es horizontal" do
        line_id = "l100_100_200_100"
        coords = @board_functions.generate_coords(line_id)
        expect(@board_functions.is_horizontal(coords)).to eq true
    end

    it "deberia devolver false si la linea es vertical" do
        line_id = "l100_100_100_200"
        coords = @board_functions.generate_coords(line_id)
        expect(@board_functions.is_horizontal(coords)).to eq false
    end

    it "sino se marco un cuadrado, el turno deberia cambiarse" do
        current_turn = 0
        players = @player_functions.generate_players(["Laura", "Paola", "Marcos"])
        no_new_squares_formed = true
        expect(@board_functions.get_current_turn(current_turn, no_new_squares_formed, players)).to eq 1
    end

    it "si se marco un cuadrado, el turno deberia mantenerse" do
        current_turn = 0
        players = @player_functions.generate_players(["Laura", "Paola", "Marcos"])
        no_new_squares_formed = false
        expect(@board_functions.get_current_turn(current_turn, no_new_squares_formed, players)).to eq 0
    end

    it "si la direccion es 'down' el mark_id deberia ser l150_150" do
       formed_square_direction = "down"
       coords = @board_functions.generate_coords("l100_100_200_100")
       expect(@board_functions.get_mark_id_by_direction(formed_square_direction, coords)).to eq "l150_150"
    end

    it "si la direccion es 'up' el mark_id deberia ser l150_150" do
       formed_square_direction = "up"
       coords = @board_functions.generate_coords("l100_200_200_200")
       expect(@board_functions.get_mark_id_by_direction(formed_square_direction, coords)).to eq "l150_150"
    end

    it "si la direccion es 'right' el mark_id deberia ser l150_150" do
       formed_square_direction = "right"
       coords = @board_functions.generate_coords("l100_100_100_200")
       expect(@board_functions.get_mark_id_by_direction(formed_square_direction, coords)).to eq "l150_150"
    end

    it "si la direccion es 'left' el mark_id deberia ser l150_150" do
       formed_square_direction = "left"
       coords = @board_functions.generate_coords("l200_100_200_200")
       expect(@board_functions.get_mark_id_by_direction(formed_square_direction, coords)).to eq "l150_150"
    end

    it "la marca del jugador 1 con el id l150_150 deberia tener opacidad 1 y color azul" do
        marks = @board_functions.generate_marks(2)
        mark_id = "l150_150"
        current_turn = 0
        @board_functions.change_opacity_and_color_of_the_mark(marks, mark_id, current_turn)
        expect(marks[0]).to have_attributes(opacity: 1, color: "#354698")
    end

    it "la marca del jugador 2 con el id l150_150 deberia tener opacidad 1 y color rojo" do
        marks = @board_functions.generate_marks(2)
        mark_id = "l150_150"
        current_turn = 1
        @board_functions.change_opacity_and_color_of_the_mark(marks, mark_id, current_turn)
        expect(marks[0]).to have_attributes(opacity: 1, color: "#C42615")
    end

    it "deberia devolver true si la linea es limite inferior" do
        coords = @board_functions.generate_coords("l100_500_200_500")
        expect(@board_functions.is_line_inferior_limit(coords,5)).to eq true
    end

    it "deberia devolver false si la linea no es limite inferior" do
        coords = @board_functions.generate_coords("l100_400_200_400")
        expect(@board_functions.is_line_inferior_limit(coords,5)).to eq false
    end

    it "deberia devolver true si la linea es limite superior" do
        coords = @board_functions.generate_coords("l100_100_200_100")
        expect(@board_functions.is_line_superior_limit(coords)).to eq true
    end

    it "deberia devolver false si la linea no es limite superior" do
        coords = @board_functions.generate_coords("l100_200_200_200")
        expect(@board_functions.is_line_superior_limit(coords)).to eq false
    end

    it "deberia devolver true si la linea es limite izquierdo" do
        coords = @board_functions.generate_coords("l100_100_100_200")
        expect(@board_functions.is_line_left_limit(coords)).to eq true
    end

    it "deberia devolver false si la linea no es limite izquierdo" do
        coords = @board_functions.generate_coords("l200_200_200_300")
        expect(@board_functions.is_line_left_limit(coords)).to eq false
    end

    it "deberia devolver true si la linea es limite derecho" do
        coords = @board_functions.generate_coords("l500_100_500_200")
        expect(@board_functions.is_line_right_limit(coords,5)).to eq true
    end

    it "deberia devolver false si la linea no es limite derecho" do
        coords = @board_functions.generate_coords("l400_100_400_200")
        expect(@board_functions.is_line_right_limit(coords,5)).to eq false
    end

    it "los vecinos inferiores generados para la linea 100,100,200,100 deberian ser l100_200_200_200, l100_100_100_200, l200_100_200_200" do
        coords = @board_functions.generate_coords("l100_100_200_100")
        neighbor_lines = @board_functions.generate_downside_neighbor_lines(coords)
        expect(neighbor_lines[0]).to eq "l100_200_200_200"
        expect(neighbor_lines[1]).to eq "l100_100_100_200"
        expect(neighbor_lines[2]).to eq "l200_100_200_200"
    end

    it "los vecinos superiores generados para la linea 100,200,200,200 deberian ser l100_100_200_100, l100_100_100_200, l200_100_200_200" do
        coords = @board_functions.generate_coords("l100_200_200_200")
        neighbor_lines = @board_functions.generate_upside_neighbor_lines(coords)
        expect(neighbor_lines[0]).to eq "l100_100_200_100"
        expect(neighbor_lines[1]).to eq "l100_100_100_200"
        expect(neighbor_lines[2]).to eq "l200_100_200_200"
    end

    it "los vecinos izquierdos generados para la linea 200,100,200,200 deberian ser l100_100_100_200, l100_100_200_100, l100_200_200_200" do
        coords = @board_functions.generate_coords("l200_100_200_200")
        neighbor_lines = @board_functions.generate_left_neighbor_lines(coords)
        expect(neighbor_lines[0]).to eq "l100_100_100_200"
        expect(neighbor_lines[1]).to eq "l100_100_200_100"
        expect(neighbor_lines[2]).to eq "l100_200_200_200"
    end

    it "los vecinos derechos generados para la linea 100,100,100,200 deberian ser l200_100_200_200, l100_100_200_100, l100_200_200_200" do
        coords = @board_functions.generate_coords("l100_100_100_200")
        neighbor_lines = @board_functions.generate_right_neighbor_lines(coords)
        expect(neighbor_lines[0]).to eq "l200_100_200_200"
        expect(neighbor_lines[1]).to eq "l100_100_200_100"
        expect(neighbor_lines[2]).to eq "l100_200_200_200"
    end

    it "la linea l100_100_200_100 deberia de cambiar de ser color azul y opacidad cuando se la dibuje" do
        lines = @board_functions.generate_lines(2)
        line_id = "l100_100_200_100"
        current_turn = 0
        @board_functions.mark_line(line_id, lines, current_turn)
        expect(lines[0]).to have_attributes(opacity: 1, color: "#354698")
    end

    it "la linea l100_100_200_100 deberia de cambiar de ser color rojo y opacidad cuando se la dibuje" do
        lines = @board_functions.generate_lines(2)
        line_id = "l100_100_200_100"
        current_turn = 1
        @board_functions.mark_line(line_id, lines, current_turn)
        expect(lines[0]).to have_attributes(opacity: 1, color: "#C42615")
    end

    it "deberia devolver down si la linea con las coordenadas (100,100, 200,100) tiene sus 3 vecinos de abajo pintados" do
        lines = @board_functions.generate_lines(2)
        coords = @board_functions.generate_coords("l100_100_200_100")
        lines.map do |l|
            l.opacity = 1
        end
        formed_squares = @board_functions.get_directions_of_formed_squares_horizontal(coords, lines, 2) 
        expect(formed_squares[0]).to eq "down"
    end

    it "deberia devolver up si la linea con las coordenadas (100,200, 200,200) tiene sus 3 vecinos de arriba pintados" do
        lines = @board_functions.generate_lines(2)
        coords = @board_functions.generate_coords("l100_200_200_200")
        lines.map do |l|
            l.opacity = 1
        end
        formed_squares = @board_functions.get_directions_of_formed_squares_horizontal(coords, lines, 2) 
        expect(formed_squares[0]).to eq "up"
    end

    it "deberia devolver down y up si la linea con las coordenadas (100,200, 200,200) tiene sus 3 vecinos de abajo y arriba pintados" do
        lines = @board_functions.generate_lines(3)
        coords = @board_functions.generate_coords("l100_200_200_200")
        lines.map do |l|
            l.opacity = 1
        end
        formed_squares = @board_functions.get_directions_of_formed_squares_horizontal(coords, lines, 3) 
        expect(formed_squares[0]).to eq "down"
        expect(formed_squares[1]).to eq "up"
    end

    it "deberia devolver una lista vacia si la linea con las coordenadas (100,200, 200,200) no forma ningun cuadrado" do
        lines = @board_functions.generate_lines(3)
        coords = @board_functions.generate_coords("l100_200_200_200")
        formed_squares = @board_functions.get_directions_of_formed_squares_horizontal(coords, lines, 3) 
        expect(formed_squares.empty?).to eq true
    end


    it "deberia devolver right si la linea con las coordenadas (100,100, 100,200) tiene sus 3 vecinos de la derecha pintados" do
        lines = @board_functions.generate_lines(2)
        coords = @board_functions.generate_coords("l100_100_100_200")
        lines.map do |l|
            l.opacity = 1
        end
        formed_squares = @board_functions.get_directions_of_formed_squares_vertical(coords, lines, 2) 
        expect(formed_squares[0]).to eq "right"
    end

    it "deberia devolver left si la linea con las coordenadas (200,100, 200,200) tiene sus 3 vecinos de la izquierda pintados" do
        lines = @board_functions.generate_lines(2)
        coords = @board_functions.generate_coords("l200_100_200_200")
        lines.map do |l|
            l.opacity = 1
        end
        formed_squares = @board_functions.get_directions_of_formed_squares_vertical(coords, lines, 2) 
        expect(formed_squares[0]).to eq "left"
    end

    it "deberia devolver right y left si la linea con las coordenadas (200,100, 200,200) tiene sus 3 vecinos de derecha e izquierda pintados" do
        lines = @board_functions.generate_lines(3)
        coords = @board_functions.generate_coords("l200_100_200_200")
        lines.map do |l|
            l.opacity = 1
        end
        formed_squares = @board_functions.get_directions_of_formed_squares_vertical(coords, lines, 3) 
        expect(formed_squares[0]).to eq "right"
        expect(formed_squares[1]).to eq "left"
    end

    it "deberia devolver una lista vacia si la linea con las coordenadas (200,100, 200,200) no forma ningun cuadrado" do
        lines = @board_functions.generate_lines(3)
        coords = @board_functions.generate_coords("l200_100_200_200")
        formed_squares = @board_functions.get_directions_of_formed_squares_vertical(coords, lines, 3) 
        expect(formed_squares.empty?).to eq true
    end

    it "deberia devolver down si la linea horizontal con las coordenadas (100,100, 200,100) forma un cuadrado" do
        lines = @board_functions.generate_lines(2)
        line_id = "l100_100_200_100"
        lines.map do |l|
            l.opacity = 1
        end
        formed_squares = @board_functions.get_directions_of_formed_squares(lines, line_id, 2) 
        expect(formed_squares[0]).to eq "down"
    end

    it "deberia devolver right si la linea vertical con las coordenadas (100,100, 100,200) forma un cuadrado" do
        lines = @board_functions.generate_lines(2)
        line_id = "l100_100_100_200"
        lines.map do |l|
            l.opacity = 1
        end
        formed_squares = @board_functions.get_directions_of_formed_squares(lines, line_id, 2) 
        expect(formed_squares[0]).to eq "right"
    end

    it "deberia devolver true si el juego termino" do
        lines = @board_functions.generate_lines(2)
        lines.map do |l|
            l.opacity = 1
        end
        expect(@board_functions.is_game_over(lines)).to eq true
    end

    it "deberia devolver falso si el juego no termino" do
        lines = @board_functions.generate_lines(2)
        expect(@board_functions.is_game_over(lines)).to eq false
    end

    it "deberia devolver true si la linea esta marcada" do
        lines = @board_functions.generate_lines(2)
        line_id = "l100_100_200_100"
        lines.map do |l|
            l.opacity = 1
        end
        expect(@board_functions.is_line_marked(line_id, lines)).to eq true
    end

    it "deberia devolver false si la linea no esta marcada" do
        lines = @board_functions.generate_lines(2)
        line_id = "l100_100_200_100"
        expect(@board_functions.is_line_marked(line_id, lines)).to eq false
    end

end