require_relative 'lib/sheepdog.rb'

demo_config = []

puts 'Input:'

while input = STDIN.gets
  puts input.strip
  demo_config << input.strip
end

paddock_size = demo_config.shift.split(' ').map(&:to_i)

puts "\nOutput:"

until demo_config.empty?
  sheepdog = Sheepdog.new(paddock_size)

  initial_pos = demo_config.shift.split(' ')
  sheepdog.place *initial_pos

  movements = demo_config.shift.split('')

  until movements.empty?
    sheepdog.move movements.shift
  end

  puts sheepdog.position.join(' ')
end
