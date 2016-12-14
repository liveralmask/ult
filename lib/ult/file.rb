def file?( path )
  File.exist?( path )
end

def filename( path )
  File.basename( path )
end

def rmfile( path )
  File.delete( path )
end
