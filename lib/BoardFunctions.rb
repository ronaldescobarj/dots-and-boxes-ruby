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
        line_functions = LineFunctions.new
        gray = "#7f7f7f"
        for i in 1..size
            for j in 1..size-1
                lineId = line_functions.generate_id(100*j, 100*i,"horizontal")
                line = Line.new(100*j, 100*i, 100*(j+1), 100*i, lineId,gray,0)
                lines.push(line)
            end
        end
        for i in 1..size-1
            for j in 1..size
                lineId = line_functions.generate_id(100*j, 100*i,"vertical")
                line = Line.new(100*j, 100*i, 100*j, 100*(i+1), lineId,gray,0)
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

end