require "ult"
extend Ult

tmp_dir = "__tmp__"
mkdir( tmp_dir ){
  mkdir( "dir" ){
    mkfile( "file.txt", "w" )
    replica( 3, "file", ".txt" )
  }
  replica( 2, "dir" )
  status, outputs = execute( "ls -laR" )
  puts outputs
}
