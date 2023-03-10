require_relative "../piece.rb"

class King < Piece
    attr_reader :symbol
    attr_accessor :first_move

    def initialize(color, position, old_position = nil, first_move = true)
        super(color, position, old_position)
        @symbol = "♚ " if color == "b"
        @symbol = "♔ " if color == "w"
        @first_move = first_move 
    end

    def move_to(new_position)
        super(new_position)

        x, y = self.position[0].to_i, self.position[1].to_i
        old_x, old_y = self.old_position[0].to_i, self.old_position[1].to_i

        # ignore the reset rules if the king is trying to castle
        if first_move == true
            return if y == 2 || y == 6
        end

        # reset moves which attempt to move the king outside of it's immediate vicinity
        if old_x > x
            if (old_x - x) > 1
                self.position = self.old_position
                self.old_position = nil
                return
            end
        elsif x > old_x
            if (x - old_x) > 1
                self.position = self.old_position
                self.old_position = nil
                return
            end
        elsif old_y > y
            if (old_y - y) > 1
                self.position = self.old_position
                self.old_position = nil
                return
            end
        elsif y > old_y
            if (y - old_y) > 1
                self.position = self.old_position
                self.old_position = nil
                return
            end
        end

    end

end