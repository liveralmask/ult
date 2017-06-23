require "ult"
extend Ult

puts "__FILE__=#{__FILE__}"
puts "dir?=#{dir?( __FILE__ )}"
puts "dirname=#{dirname( __FILE__ )}"
direach( "." ){|name, path|
  puts "name=#{name} path=#{path}"
}
dir( "/" ){
  puts "pwd=#{pwd}"
}
puts "#{pwd}"
dir( "/" )
puts "#{pwd}"
