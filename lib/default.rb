# Make sure we're using nanoc 2.2 or higher
if Nanoc::VERSION < '2.2'
  puts 'WARNING:'
  puts 'You need nanoc 2.2 or higher to compile this site. If you really ' +
       'want to compile this site with an older version of nanoc, set ' +
       'FORCE to true in your environment.'

  exit unless ENV['FORCE'] == 'true'
end

module MOULSite

  # Contains all MO:UL site-specific helpers reside
  module Helpers
  end

end
