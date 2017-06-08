require "ult"
extend Ult

args = ARGV.empty? ? [ "date" ] : ARGV
status = execute( *args )
puts "status=#{status}"

execute( *args ){|type, io, msg|
  p [ type, io, msg ]
}
