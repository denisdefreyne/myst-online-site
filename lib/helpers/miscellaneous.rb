module MOULSite::Helpers

  # Contains all miscellaneous helper functions that don't fit elsewhere.
  module Miscellaneous

    WEBSITE_URLS = {
      :guild_of_maintainers => 'http://www.guildofmaintainers.org/',
      :guild_of_messengers  => 'http://www.guildofmessengers.com/',
      :guild_of_writers     => 'http://www.guildofwriters.com/'
    }

    # Returns the item with the given item ID.
    def item(item_id)
      @items.find { |item| item[:item_id] == item_id }
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

end
