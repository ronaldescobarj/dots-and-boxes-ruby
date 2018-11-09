class LineFunctions

    def generate_id(x1,y1,direction)
        return direction == "horizontal" ? generate_id_horizontal(x1,y1) : generate_id_vertical(x1,y1)
    end

    def generate_id_string(x1,y1,x2,y2)
        return "l" + x1.to_s + "_" + y1.to_s  + "_" + x2.to_s + "_" + y2.to_s
    end

    def generate_id_horizontal(x1,y1)
        x2 = x1.to_i + 100
        y2 = y1
        return generate_id_string(x1,y1,x2,y2)
    end

    def generate_id_vertical(x1,y1)
        y2 = y1.to_i + 100
        x2 = x1
        return generate_id_string(x1,y1,x2,y2)
    end

    def generate_mark_id(x1,y1)
        return "l" + x1.to_s + "_" + y1.to_s
    end
end