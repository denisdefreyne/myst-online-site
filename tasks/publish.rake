namespace :publish do

  desc 'Publish site to the staging server'
  task :staging do
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
    src = '/Users/ddfreyne/Documents/Development/nanoc/sites-moul/output/' # trailing slash
    dst = 'ddfreyne@ectype:/home/ddfreyne/sites/moul-new/public'           # no trailing slash

    # Don't touch this!
    puts 'Publishing site...'
    system('rsync', '-gpPtrvz', '--delete-after', src, dst)
    puts 'Site published.'
  end

  desc 'Publish site assets to the assets server'
  task :assets do
    # Settings
    src = '/Users/ddfreyne/Documents/Development/nanoc/sites-moul/output/assets/' # trailing slash
    dst = 'ddfreyne@ectype:/home/ddfreyne/sites/moul-assets/public/assets'        # no trailing slash

    # Don't touch this!
    puts 'Publishing assets...'
    system('rsync', '-gpPtrvz', '--delete-after', src, dst)
    puts 'Assets published.'
  end

end
