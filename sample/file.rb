require "ult"
extend Ult

puts "__FILE__=#{__FILE__}"
puts "file?=#{file?( __FILE__ )}"
puts "filename=#{filename( __FILE__ )}"
