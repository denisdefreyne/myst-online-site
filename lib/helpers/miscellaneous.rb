module MOULSite::Helpers

  # Contains all miscellaneous helper functions that don't fit elsewhere.
  module Miscellaneous

    WEBSITE_URLS = {
      :guild_of_maintainers => 'http://www.guildofmaintainers.org/',
      :guild_of_messengers  => 'http://www.guildofmessengers.com/',
      :guild_of_writers     => 'http://www.guildofwriters.com/'
    }

    # Returns the item with the given identifier.
    def item_named(identifier)
      @items.find { |i| i.identifier == identifier }
    end

    # Returns the web site for the given identifier.
    def website_of(id)
      WEBSITE_URLS[id]
    end

    # Returns the properly marked up translated guild name.
    def translated_guild_name(id, translated, original)
      link_to(translated, website_of(id), :title => original) + %[ (<span lang="en">#{original}</span>)]
    end

    # Returns the list of sorted articles below the given parent item (e.g. /nl/over/nieuws/).
    def articles_below(parent_item)
      parent_item = item_named(parent_item) if parent_item.is_a? String
      articles = parent_item.children.select { |a| a[:kind] == 'article' }
      articles.sort_by { |a| a[:created_at] }.reverse
    end

    # Returns the ID of this item (e.g. about-news). This ID can be used in the class HTML attribute.
    def item_id_of(item)
      canonical_identifier = canonical_identifier_of(item)
      return if canonical_identifier.nil?

      item_id_candidate = canonical_identifier.gsub(/^\/|\/$/, '').gsub('/', '-')
      item_id_candidate.empty? ? 'home' : item_id_candidate
    end

  end

end
