class Player
    def initialize(name,color,score,id)
        @name = name
        @color = color
        @score = score
        @id = id
    end

    def name
        @name
    end

    def color
        @color
    end

    def score
        @score
    end

    def id
        @id
    end

    def name=(n)
        @name = n
    end

    def color=(c)
        @color = c
    end

    def score=(s)
        @score = s
    end

    def id=(i)
        @id = i
    end
end