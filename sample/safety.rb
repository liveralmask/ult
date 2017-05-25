require "ult"
extend Ult

safety{
  puts "pwd=#{pwd}"
}

safety{
  dir( ".." ){
    xyz
  }
}
