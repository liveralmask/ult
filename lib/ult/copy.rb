require "fileutils"
require "ult/dir"

def copy( src, dst )
  dir?( src ) ? FileUtils.cp_r( src, dst ) : FileUtils.copy( src, dst )
end
