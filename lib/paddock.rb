class Paddock
  attr_accessor :dimensions

  MOVEMENTS = {
    'E' => { l: 'N', r: 'S', xmove: 1,  ymove: 0  },
    'S' => { l: 'E', r: 'W', xmove: 0,  ymove: -1 },
    'W' => { l: 'S', r: 'N', xmove: -1, ymove: 0  },
    'N' => { l: 'W', r: 'E', xmove: 0,  ymove: 1  }
  }

  def initialize size = [5,5]
    @dimensions = size
    @_position = nil
  end

  def position coordinates=nil
    if coordinates==nil or out_of_bounds? coordinates[0..1]
      return @_position
    end

    @_position = coordinates
  end

  def move
    pos = position
    moves = MOVEMENTS[pos[2]]
    new_pos = [pos[0] + moves[:xmove], pos[1] + moves[:ymove], pos[2]]
    position [new_pos[0], new_pos[1], new_pos[2]]
  end

  def turn direction
    pos = position
    moves = MOVEMENTS[pos[2]]
    position [pos[0], pos[1], moves[direction.downcase.to_sym]]
  end

  def out_of_bounds? coordinates
    return  (coordinates[0] < 0 or coordinates[0] > @dimensions[0] or 
            coordinates[1] < 0 or coordinates[1] > @dimensions[1])
  end
end