def platform
  platform = RUBY_PLATFORM
  case platform
  when /darwin/
    os_type = :mac
  when /linux/
    os_type = :linux
  when /win/
    os_type = :windows
  else
    os_type = :unknown
  end
  [ platform, os_type ]
end
