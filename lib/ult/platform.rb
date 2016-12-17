def platform
  platform = RUBY_PLATFORM
  case platform
  when /darwin/
    type = :mac
  else
    type = :unknown
  end
  [ platform, type ]
end
