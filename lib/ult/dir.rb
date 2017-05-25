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
  Dir.chdir( path, &block )
end

def pwd
  Dir.pwd
end

def mkdir( path, &block )
  FileUtils.mkdir_p( path ) if ! dir?( path )
  dir( path, &block )
end

def rmdir( path )
  FileUtils.rm_rf( path ) if dir?( path )
end

def rmkdir( path )
  rmdir( path )
  mkdir( path )
end
