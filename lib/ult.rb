require "ult/version"

module Ult
  extend self
  
  require "ult/execute"
  module_function :execute
  
  require "ult/path"
  module_function :fullpath
  
  require "ult/option"
  module_function :option
  
  require "ult/file"
  module_function :file?, :filename, :extname, :mkfile, :rmfile
  
  require "ult/dir"
  module_function :dir?, :dirname, :direach, :dir, :pwd, :mkdir, :rmdir, :rmkdir
  
  require "ult/find"
  module_function :find
  
  require "ult/platform"
  module_function :platform, :os_type
  
  require "ult/replica"
  module_function :replica
  
  require "ult/copy"
  module_function :copy
  
  require "ult/remove"
  module_function :remove
  
  require "ult/watchdog"
  module_function :watchdog
  
  require "ult/assert"
  module_function :assert
end
