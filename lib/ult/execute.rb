def execute( command, input = "", &block )
  status = -1
  block = lambda{|type, io, msg| io.print msg} if ! block_given?
  begin
    i_r, i_w = IO.pipe
    o_r, o_w = IO.pipe
    e_r, e_w = IO.pipe
    
    pid = Process.fork{
      i_w.close
      STDIN.reopen( i_r )
      STDOUT.reopen( o_w )
      STDERR.reopen( e_w )
      exec( command )
    }
    o_w.close
    e_w.close
    i_r.close
    i_w.write input
    i_w.close
    
    # IOブロックによるプロセス停止を防ぐため、スレッドで定期的に読み取る
    block.call( :cmd, $stdout, "#{command}\n" )
    out_thread = Thread.start{
      chars = []
      o_r.each_char{|c|
        chars.push c
        case c
        when /[\r\n]/
          block.call( :out, $stdout, chars.join )
          chars = []
        end
      }
      block.call( :out, $stdout, chars.join ) if ! chars.empty?
    }
    err_thread = Thread.start{
      chars = []
      e_r.each_char{|c|
        chars.push c
        case c
        when /[\r\n]/
          block.call( :err, $stderr, chars.join )
          chars = []
        end
      }
      block.call( :err, $stderr, chars.join ) if ! chars.empty?
    }
    
    Process.waitpid( pid )
    status = $?.exitstatus
    out_thread.join
    err_thread.join
  end
  status
end

def shell( command, &block )
  status = execute( command )
  if block_given?
    status = block.call( status )
  else
    raise "#{command} => #{status}" if 0 != status
  end
  status
end
