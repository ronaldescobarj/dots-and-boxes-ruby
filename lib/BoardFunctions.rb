require_relative "LineFunctions"
require_relative 'Circle'
require_relative 'Line'
require "ostruct"

class BoardFunctions
    
    $gray = "#7f7f7f"
    $dark_gray = "#66636C"
    $turns = ["#354698", "#C42615", "#EAA81D", "#86B71B", "#7A3AB9"]
    $line_functions = LineFunctions.new
    
    def generate_coords(id)
        line_id = id.clone
        line_id.slice!(0)
        coordinates = line_id.split("_")
        coords = OpenStruct.new
        coords.x1 = coordinates[0].to_i
        coords.y1 = coordinates[1].to_i
        coords.x2 = coordinates[2].to_i
        coords.y2 = coordinates[3].to_i
        return coords
    end

    def is_horizontal(coords)
        return coords.y1 == coords.y2
    end

    def get_directions_of_formed_squares(lines, id, size)
        coords = generate_coords(id)
        formed_squares_directions = []
        if (is_horizontal(coords))
            formed_squares_directions = get_directions_of_formed_squares_horizontal(coords, lines, size)
        else
            formed_squares_directions = get_directions_of_formed_squares_vertical(coords, lines, size)
        end
        return formed_squares_directions
    end

    def get_current_turn(current_turn, no_new_squares_formed, players)
        if (no_new_squares_formed)
            current_turn = next_turn(current_turn, players)
        end
        return current_turn
    end

    def make_marks_visible(formed_squares_directions, marks, line_id, current_turn)
        coords = generate_coords(line_id)
        for square in formed_squares_directions
            mark_id = get_mark_id_by_direction(square, coords)
            change_opacity_and_color_of_the_mark(marks, mark_id,current_turn)
        end
    end

    def get_mark_id_by_direction(formed_square_direction, coords)
        case formed_square_direction
        when "down"
            mark_id = $line_functions.generate_mark_id(coords.x1 + 50, coords.y1 + 50)
        when "right"
            mark_id = $line_functions.generate_mark_id(coords.x1 + 50, coords.y1 + 50)
        when "up"
            mark_id = $line_functions.generate_mark_id(coords.x1 + 50, coords.y1 - 50)
        when "left"
            mark_id = $line_functions.generate_mark_id(coords.x1 - 50, coords.y1 + 50)
        end
        return mark_id
    end

    def next_turn(current_turn, players)
        current_turn = current_turn + 1
        if (current_turn == players.length)
            current_turn = 0
        end
        return current_turn
    end

    def change_opacity_and_color_of_the_mark(marks, mark_id, current_turn)
        marks.map do |mark|
            if (mark.id == mark_id)
                mark = modify_opacity(mark)
                color = $turns[current_turn]
                mark = modify_color(mark, color)
            end
        end
    end
    
    def is_line_inferior_limit(coords, size)
        return coords.y2 == size*100
    end

    def is_line_superior_limit(coords)
        return coords.y1 == 100
    end

    def is_line_right_limit(coords, size)
        return coords.x2 == size*100
    end

    def is_line_left_limit(coords)
        return coords.x1 == 100
    end

    def get_directions_of_formed_squares_horizontal(coords, lines, size) 
        $line_functions = LineFunctions.new
        formed_squares_directions = []
        if (! is_line_inferior_limit(coords, size))
            if (are_downside_neighbor_lines_filled(coords, lines))
                formed_squares_directions.push("down")
            end
        end
        if (! is_line_superior_limit(coords)) 
            if (are_upside_neighbor_lines_filled(coords, lines)) 
                formed_squares_directions.push("up")
            end
        end
        return formed_squares_directions
    end

    def get_directions_of_formed_squares_vertical(coords, lines, size) 
        $line_functions = LineFunctions.new
        formed_squares_directions = []        
        if (! is_line_right_limit(coords, size))
            if (are_right_neighbor_lines_filled(coords, lines)) 
                formed_squares_directions.push("right")
            end
        end
        if (! is_line_left_limit(coords)) 
            if (are_left_neighbor_lines_filled(coords, lines)) 
                formed_squares_directions.push("left")
            end
        end
        return formed_squares_directions
    end

    def generate_downside_neighbor_lines(coords)
        neighbor_lines = []
        temp_coords = coords.clone
        temp_coords.y1 += 100
        temp_coords.y2 += 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        temp_coords.y1 -= 100
        temp_coords.x2 -= 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        temp_coords.x1 += 100
        temp_coords.x2 += 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        return neighbor_lines
    end

    def are_downside_neighbor_lines_filled(coords, lines) 
        neighbor_lines = generate_downside_neighbor_lines(coords)
        return all_neighbor_lines_are_filled(neighbor_lines, lines)
    end

    def generate_upside_neighbor_lines(coords)
        neighbor_lines = []
        temp_coords = coords.clone
        temp_coords.y1 -= 100
        temp_coords.y2 -= 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        temp_coords.y2 += 100
        temp_coords.x2 -= 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        temp_coords.x1 += 100
        temp_coords.x2 += 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        return neighbor_lines
    end

    def are_upside_neighbor_lines_filled(coords, lines) 
        neighbor_lines = generate_upside_neighbor_lines(coords)        
        return all_neighbor_lines_are_filled(neighbor_lines, lines)
    end

    def generate_left_neighbor_lines(coords)
        neighbor_lines = []
        temp_coords = coords.clone
        temp_coords.x1 -= 100
        temp_coords.x2 -= 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        temp_coords.x2 += 100
        temp_coords.y2 -= 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        temp_coords.y1 += 100
        temp_coords.y2 += 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        return neighbor_lines
    end

    def are_left_neighbor_lines_filled(coords, lines)
        neighbor_lines = generate_left_neighbor_lines(coords)        
        return all_neighbor_lines_are_filled(neighbor_lines, lines)
    end

    def generate_right_neighbor_lines(coords)
        neighbor_lines = []
        temp_coords = coords.clone
        temp_coords.x1 += 100
        temp_coords.x2 += 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        temp_coords.x1 -= 100
        temp_coords.y2 -= 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        temp_coords.y1 += 100
        temp_coords.y2 += 100
        neighbor_lines.push($line_functions.generate_id_string_object(temp_coords))
        return neighbor_lines
    end

    def are_right_neighbor_lines_filled(coords, lines)
        neighbor_lines = generate_right_neighbor_lines(coords)
        return all_neighbor_lines_are_filled(neighbor_lines, lines)
    end

    def all_neighbor_lines_are_filled(neighbor_lines, lines)
        all_neighbor_lines_are_filled = true
        lines.each do |line|
            if neighbor_lines.include?(line.id)
                if (line.opacity != 1)
                    all_neighbor_lines_are_filled = false
                end
            end
        end
        return all_neighbor_lines_are_filled
    end

    def generate_circles(size)
        circles = []
        for i in 1..size
            for j in 1..size
                circle = Circle.new(100*j, 100*i, 10, 0 ,$dark_gray,1)
                circles.push(circle)
            end
        end
        return circles
    end

    def generate_lines(size)
        lines = []
        opacity = 0.3
        lines.concat(generate_horizontal_lines(size))
        lines.concat(generate_vertical_lines(size))
        return lines
    end

    def generate_horizontal_lines(size)
        $line_functions = LineFunctions.new        
        lines = []
        for i in 1..size
            for j in 1..size-1
                lineId = $line_functions.generate_id(100*j, 100*i,"horizontal")
                line = Line.new(100*j, 100*i, 100*(j+1), 100*i, lineId,$gray,0.3)
                lines.push(line)
            end
        end
        return lines
    end

    def generate_vertical_lines(size)
        $line_functions = LineFunctions.new        
        lines = []
        for i in 1..size-1
            for j in 1..size
                lineId = $line_functions.generate_id(100*j, 100*i,"vertical")
                line = Line.new(100*j, 100*i, 100*j, 100*(i+1), lineId,$gray,0.3)
                lines.push(line)
            end
        end
        return lines
    end

    def generate_marks(size)
        $line_functions = LineFunctions.new
        marks = []
        for i in 1..size
            for j in 1..size
                mark_id = $line_functions.generate_mark_id((100*j)+50, (100*i)+50)
                mark = Circle.new((100*j)+50, (100*i)+50, 7, mark_id,$gray,0)
                marks.push(mark)
            end
        end
        return marks
    end

    def modify_opacity(element)
        element.opacity = 1
        return element
    end

    def modify_color(element, color)
        element.color = color
        return element
    end

    def mark_line(line_id, lines, current_turn)
        lines.map do |line|
            if (line.id == line_id)
                modify_opacity(line)
                modify_color(line, $turns[current_turn])
            end
        end
    end

    def is_game_over(lines)
        for line in lines
            if line.opacity != 1
                return false
            end
        end
        return true
    end

    def is_line_marked(line_id, lines)
        for line in lines
            if line_id == line.id
                if line.opacity == 1
                    return true
                end
            end
        end
        return false
    end

end