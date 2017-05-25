require "ult/dir"

def safety( &block )
  root_dir = pwd
  begin
    block.call
  rescue Exception => e
    dir( root_dir )
    raise e
  rescue StandardError => e
    dir( root_dir )
    raise e
  end
  dir( root_dir )
end
