module Nanoc3
  module Tasks
  end
end

$LOAD_PATH.unshift('/Users/ddfreyne/Documents/Development/nanoc/nanoc-3.0.x/lib')

begin
  require 'nanoc3/tasks/validate'
rescue LoadError
  warn "Some rake tasks require nanoc3 to run, which is not installed on " +
       "your system. (But don't worry; all these tasks are optional.)"
end
