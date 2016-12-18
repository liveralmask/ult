def file?( path )
  File.exist?( path )
end

def filename( path )
  File.basename( path )
end

def extname( path )
  /^\.?.+?\.(.+)$/ =~ path ? $1 : ""
end

def mkfile( path, mode, &block )
  open( path, mode ){|file|
    block.call( file ) if block_given?
  }
end

def rmfile( path )
  File.delete( path ) if file?( path )
end
