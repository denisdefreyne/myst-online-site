LANGUAGES = [ :en, :de, :fr, :fi, :it, :nl ]

namespace :ping do

  desc "Ping all translations on FeedBurner"
  task :all => LANGUAGES

  LANGUAGES.each do |lang|
    desc "Ping the #{lang} translation on FeedBurner"
    task lang do
      require 'xmlrpc/client'
      require 'pp'

      puts "Pinging #{lang}..."

      server = XMLRPC::Client.new2('http://ping.feedburner.com')
      result = server.call('weblogUpdates.ping', "Myst Online: Uru Live web site (#{lang})", "http://mystonline.com/#{lang}/")
      pp result
    end
  end

end
