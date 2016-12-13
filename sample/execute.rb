require "ult"
extend Ult

status, outputs, errors, command, input = execute *ARGV
puts command
puts input
puts "status=#{status}"
if ! outputs.empty?
  puts "[outputs]"
  puts outputs
end
if ! errors.empty?
  puts "[errors]"
  puts errors
end
