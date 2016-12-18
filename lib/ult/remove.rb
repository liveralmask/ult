require "ult/dir"
require "ult/file"

def remove( path )
  dir?( path ) ? rmdir( path ) : rmfile( path )
end
