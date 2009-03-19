# Helpers - built-in
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::HTMLEscape
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Render
include Nanoc::Helpers::XMLSitemap

# Module in which all MO:UL site-specific helpers reside
module MOULSiteHelpers

  WEBSITE_URLS = {
    :guild_of_maintainers => 'http://www.guildofwriters.com/',
    :guild_of_messengers  => 'http://www.guildofmessengers.com/',
    :guild_of_writers     => 'http://www.guildofmaintainers.org/'
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
