require "ult/dir"

def safety( &block )
  root_dir = pwd
  result = nil
  begin
    block.call
  rescue Exception => e
    result = e
  rescue StandardError => e
    result = e
  ensure
    dir( root_dir ) if root_dir != pwd
    result
  end
end
