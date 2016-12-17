require "fileutils"
require "ult/path"

def dir?( path )
  Dir.exist?( path )
end

def dirname( path )
  File.dirname( path )
end

def direach( path )
  Dir::foreach( path ){|name|
    case name
    when ".", ".."
    else
      yield( name, fullpath( name, path ) )
    end
  }
end

def dir( path, &block )
  Dir.chdir( path ){
    block.call
  }
end

def pwd
  Dir.pwd
end

def mkdir( path )
  FileUtils.mkdir_p( path )
end

def rmdir( path )
  FileUtils.rm_rf( path )
end
