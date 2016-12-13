require "ult"
extend Ult

option{
  on( "-o VALUE", "--option VALUE" ){|value|
    puts "option=#{value}"
  }
  on( "--version" ){
    puts "version=#{Ult::VERSION}"
  }
  parse!( ARGV )
}
puts "ARGV=#{ARGV}"
