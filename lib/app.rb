require_relative 'sheepdog.rb'

class App
  def initialize(config)
    @config = config
    @sheepdog = Sheepdog.new(paddock_size)
  end

  def process
    output = []

    until @config.empty?
      initial_pos, movements = read_next_play
      @sheepdog.place(*initial_pos)

      until movements.empty?
        @sheepdog.move(movements.shift)
      end

      output << @sheepdog.position.join(' ')
    end

    output
  end

  private

  def read_next_play
    initial_pos = next_config_line.split(' ')
    movements = next_config_line.split('')
    [initial_pos, movements]
  end

  def next_config_line
    @config.shift
  end

  def paddock_size
    @paddock_size ||= next_config_line.split(' ').map(&:to_i)
  end
end
