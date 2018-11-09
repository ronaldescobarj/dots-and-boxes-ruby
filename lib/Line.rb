class Line
    def initialize(x1,y1,x2,y2,id,color,opacity)
        @x1 = x1
        @y1 = y1
        @x2 = x2
        @y2 = y2
        @id = id
        @color = color
        @opacity = opacity
    end

    def x1
        @x1
    end

    def y1
        @y1
    end

    def x2
        @x2
    end

    def y2
        @y2
    end

    def id
        @id
    end

    def color
        @color
    end

    def color=(c)
        @color = c
    end

    def opacity
        @opacity
    end

    def opacity=(o)
        @opacity = o
    end
end