def execute( command, input = "" )
  status  = -1
  outputs = []
  errors  = []
  begin
    i_r, i_w = IO.pipe
    o_r, o_w = IO.pipe
    e_r, e_w = IO.pipe
    pid = Process.fork{
      i_w.close
      o_r.close
      e_r.close
      STDIN.reopen( i_r )
      STDOUT.reopen( o_w )
      STDERR.reopen( e_w )
      Process.exec( command )
    }
    o_w.close
    e_w.close
    i_r.close
    i_w.write input
    i_w.close
    
    # IOブロックによるプロセス停止を防ぐため、スレッドで定期的に読み取る
    outputs_thread = Thread.start{
      o_r.each{|line|
        outputs.push line.chomp
      }
    }
    errors_thread = Thread.start{
      e_r.each{|line|
        errors.push line.chomp
      }
    }
    
    Process.waitpid( pid )
    status = $?.exitstatus
  rescue => err
    errors.push err.inspect
    errors.push err.backtrace
  ensure
    o_r.close
    e_r.close
    outputs_thread.join
    errors_thread.join
  end
  [ status, outputs, errors, command, input ]
end
