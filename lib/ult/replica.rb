require "ult/dir"
require "ult/file"
require "ult/copy"
require "ult/remove"

def replica( count, prefix, suffix = "" )
  src = "#{prefix}#{suffix}"
  if dir?( src )
    count.times{|index|
      dst = "#{prefix}#{index + 1}#{suffix}"
      remove( dst )
      copy( src, dst )
    }
  elsif file?( src )
    count.times{|index|
      dst = "#{prefix}#{index + 1}#{suffix}"
      remove( dst )
      copy( src, dst )
    }
  end
end
