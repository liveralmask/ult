def file?( path )
  File.exist?( path )
end

def filename( path )
  File.basename( path )
end

def mkfile( path, mode, &block )
  open( path, mode ){|file|
    block.call( file )
  }
end

def rmfile( path )
  File.delete( path )
end
