require_relative "paddock.rb"

class Sheepdog
  attr_accessor :paddock

  def initialize size = [5,5]
    @paddock = Paddock.new size
  end

  def position
    @paddock.position
  end

  def place x=0, y=0, dir='N'
    @paddock.position [x.to_i, y.to_i, dir]
  end

  def move command
    case command
    when 'L', 'R'
      @paddock.turn command
    when 'M'
      @paddock.move
    else
    end
  end
end