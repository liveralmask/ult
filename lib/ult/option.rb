require "optparse"

def option( *args, &block )
  OptionParser.new( *args ).instance_eval( &block )
end
