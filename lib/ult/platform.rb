def platform
  platform = RUBY_PLATFORM
  case platform
  when /darwin/
    os_type = :mac
  else
    os_type = :unknown
  end
  [ platform, type ]
end
