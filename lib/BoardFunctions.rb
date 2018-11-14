require_relative "LineFunctions"
require_relative 'Circle'
require_relative 'Line'

class BoardFunctions
    
    def generate_circles(size)
        circles = []
        for i in 1..size
            for j in 1..size
                circle = Circle.new(100*j, 100*i, 10, 0 ,"#66636C",1)
                circles.push(circle)
            end
        end
        return circles
    end

    def generate_lines(size)
        lines = []
        gray = "#7f7f7f"
        opacity = 0.3
        lines.concat(generate_horizontal_lines(size))
        lines.concat(generate_vertical_lines(size))
        return lines
    end

    def generate_horizontal_lines(size)
        line_functions = LineFunctions.new        
        lines = []
        for i in 1..size
            for j in 1..size-1
                lineId = line_functions.generate_id(100*j, 100*i,"horizontal")
                line = Line.new(100*j, 100*i, 100*(j+1), 100*i, lineId,"#7f7f7f",0.3)
                lines.push(line)
            end
        end
        return lines
    end

    def generate_vertical_lines(size)
        line_functions = LineFunctions.new        
        lines = []
        for i in 1..size-1
            for j in 1..size
                lineId = line_functions.generate_id(100*j, 100*i,"vertical")
                line = Line.new(100*j, 100*i, 100*j, 100*(i+1), lineId,"#7f7f7f",0.3)
                lines.push(line)
            end
        end
        return lines
    end

    def generate_marks(size)
        line_functions = LineFunctions.new
        marks = []
        gray = "#7f7f7f"
        for i in 1..size
            for j in 1..size
                mark_id = line_functions.generate_mark_id((100*j)+50, (100*i)+50)
                mark = Circle.new((100*j)+50, (100*i)+50, 7, mark_id,gray,0)
                marks.push(mark)
            end
        end
        return marks
    end

    def modify_opacity(x)
        x.opacity = 1
        return x
    end

    def mark_line(x1,x2,direction,lines)
        line_functions = LineFunctions.new
        id = line_functions.generate_id(x1,x2,direction)
        puts id
        lines.map { |x| x.id == id ? modify_opacity(x) : x }
    end

end