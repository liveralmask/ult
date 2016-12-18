require "ult"
extend Ult

args = ARGV.empty? ? [ "date" ] : ARGV
status, outputs, errors, command, input = execute *args
puts command
if ! input.empty?
  puts "[input]"
  puts input
end
puts "status=#{status}"
if ! outputs.empty?
  puts "[outputs]"
  puts outputs
end
if ! errors.empty?
  puts "[errors]"
  puts errors
end
