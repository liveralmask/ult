require "ult"
extend Ult

args = ARGV.empty? ? [ "date" ] : ARGV
status = execute( *args )
puts "execute status=#{status}"

execute( *args ){|type, io, msg|
  p [ type, io, msg ]
}

shell( *args ){|status|
  puts "shell status=#{status}"
}

shell( *args )
