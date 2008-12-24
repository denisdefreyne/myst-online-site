module Nanoc::Filters
  class PHP < Nanoc::Filter

    identifiers :php

    def run(content)
      require 'open3'

      return content if ENV['SKIP_PHP'] == 'YES'

      stdin, stdout, stderr = Open3.popen3('/usr/bin/php')
      stdin.write(content)
      stdin.close
      result = stdout.read
      stdout.close
      stderr.close

      result
    end

  end
end
