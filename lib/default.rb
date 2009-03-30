# Make sure we're using nanoc 2.2 or higher
if Nanoc::VERSION < '2.2'
  puts 'WARNING:'
  puts 'You need nanoc 2.2 or higher to compile this site. If you really ' +
       'want to compile this site with an older version of nanoc, set ' +
       'FORCE to true in your environment.'

  exit unless ENV['FORCE'] == 'true'
end

# Module in which all MO:UL site-specific helpers reside
module MOULSiteHelpers

  WEBSITE_URLS = {
    :guild_of_maintainers => 'http://www.guildofmaintainers.org/',
    :guild_of_messengers  => 'http://www.guildofmessengers.com/',
    :guild_of_writers     => 'http://www.guildofwriters.com/'
  }

  # Returns the asset with the given asset ID.
  def asset(asset_id)
    @assets.find { |asset| asset.asset_id == asset_id }
  end

  # Returns the web site for the given identifier.
  def website_of(id)
    WEBSITE_URLS[id]
  end

  # Returns the properly marked up translated guild name.
  def translated_guild_name(id, translated, original)
    link_to(translated, website_of(id), :title => original) + %[ (<span lang="en">#{original}</span>)]
  end

end

include MOULSiteHelpers
