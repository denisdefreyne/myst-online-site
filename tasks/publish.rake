task :publish do
  # This tasks uploads the content of the 'output' directory to the web
  # server. This specific rake task is specific to the Myst Online web site,
  # but it should be easy to adjust it to meet your own needs.
  #
  # This tasks requires rsync.
  #    
  # To configure, set 'src' to the path of the output directory on your local
  # computer (include a trailing slash). Set 'dst' to the path to your web
  # root (without trailing slash). Take a look at the example to see how it's
  # done (it's just a really simple rsync wrapper though).

  # Settings
  src = '/Users/ddfreyne/Documents/Cyan/Myst Online/Website/moul-nanoc/output/' # trailing slash
  dst = 'ddfreyne@ectype:/home/ddfreyne/sites/moul-new/public'                  # no trailing slash

  # Don't touch this!
  puts 'Publishing site...'
  system('rsync', '-gpPrvz', '--exclude=".hg"', src, dst)
  puts 'Site published.'
end
