def platform
  RUBY_PLATFORM
end

def mac?
  ! platform.match( /darwin/ ).nil?
end

def linux?
  ! platform.match( /linux/ ).nil?
end

def windows?
  mac? ? false : ! platform.match( /win/ ).nil?
end
