require_relative 'lib/app.rb'

puts 'Input:'

demo_config = []
while input = STDIN.gets
  puts input.strip
  demo_config << input.strip
end

puts "\nOutput:"

app = App.new(demo_config)
puts app.process.join("\n")
