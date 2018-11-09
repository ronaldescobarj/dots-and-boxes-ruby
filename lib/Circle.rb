class Circle
    def initialize(x,y,r,id,color,opacity)
        @x = x
        @y = y
        @r = r
        @id = id
        @color = color
        @opacity = opacity
    end

    def x
        @x
    end

    def y
        @y
    end

    def r
        @r
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