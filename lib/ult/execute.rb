def execute( command, input = "", &block )
  block = lambda{|type, io, msg| io.puts msg } if ! block_given?
  status  = -1
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
    block.call( :cmd, $stdout, command )
    out_thread = Thread.start{
      o_r.each{|line| block.call( :out, $stdout, line.chomp ) }
    }
    err_thread = Thread.start{
      e_r.each{|line| block.call( :err, $stderr, line.chomp ) }
    }
    
    Process.waitpid( pid )
    status = $?.exitstatus
    out_thread.join
    err_thread.join
  end
  status
end
