require "ult"
extend Ult

args = ARGV.empty? ? [ "date" ] : ARGV
puts "----- execute start [#{args.join( ' ' )}] -----"
status = execute( *args )
puts "\n----- execute end [#{args.join( ' ' )}] status=#{status} -----"

puts "----- execute start [#{args.join( ' ' )}] -----"
execute( *args ){|type, io, msg|
  p [ type, io, msg ]
}
puts "----- execute end [#{args.join( ' ' )}] -----"

puts "----- shell start [#{args.join( ' ' )}] -----"
status = shell( *args ){|status|
  puts "\nshell status=#{status}"
  "success"
}
puts "----- shell end [#{args.join( ' ' )}] status=#{status} -----"

puts "----- shell start [#{args.join( ' ' )}] -----"
shell( *args )
puts "\n----- shell end [#{args.join( ' ' )}] -----"
