module MOULSite::Helpers::Localization

  # Language names in English
  ENGLISH_LANGUAGE_NAMES = {
    'en' => 'English',
    'de' => 'German',
    'es' => 'Spanish',
    'fi' => 'Finnish',
    'fr' => 'French',
    'it' => 'Italian',
    'nl' => 'Dutch'
  }

  # RequiredMethods contains methods required by Nanoc::Helpers::Localization.
  module RequiredMethods

    # Returns the language_code attribute, or, if the former is nil, the
    # language code derived from the path.
    def language_code_of(item)
      item.language_code || (item.path.match(/^\/(..)\//) || [])[1]
    end

    # Returns the item_id attribute of the given item.
    def canonical_identifier_of(item)
      item.item_id
    end

  end

  include RequiredMethods

  # Returns the item's human-readable language in English
  def language_of(item)
    ENGLISH_LANGUAGE_NAMES[language_code_of(item)]
  end

  # Returns all articles in the given language
  def articles_in(lang)
    items_in(lang).select { |p| p.kind == 'article' }
  end

end
