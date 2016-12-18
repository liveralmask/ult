def platform
  RUBY_PLATFORM
end

def os_type
  case platform
  when /darwin/
    :mac
  when /linux/
    :linux
  when /win/
    :windows
  else
    :unknown
  end
end
