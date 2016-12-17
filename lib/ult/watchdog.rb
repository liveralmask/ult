require "ult/execute"

def watchdog( command, input = "", &block )
  loop{
    status, outputs, errors = execute( command, input )
    break if ! block.call( status, outputs, errors )
  }
end
