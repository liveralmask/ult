require "ult/dir"
require "ult/file"
require "ult/copy"

def replica( count, prefix, suffix = "" )
  src = "#{prefix}#{suffix}"
  if dir?( src )
    count.each{|index|
      dst = "#{prefix}#{index + 1}#{suffix}"
      rmdir( dst ) if dir?( dst )
      copy( src, dst )
    }
  elsif file?( src )
    count.each{|index|
      dst = "#{prefix}#{index + 1}#{suffix}"
      rmfile( dst ) if file?( dst )
      copy( src, dst )
    }
  end
end
