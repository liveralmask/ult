def assert( condition, msg, error_type = RuntimeError )
  raise( error_type, msg, caller( 1 ) ) if ! condition
end
