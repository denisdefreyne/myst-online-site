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

  # Returns the language_code attribute, or, if the former is nil, the
  # language code derived from the path.
  def language_code_of(item)
    item.language_code || (item.path.match(/^\/(..)\//) || [])[1]
  end

  # Returns the item_id attribute of the given item.
  def canonical_identifier_of(item)
    item.item_id
  end

  # Returns the item's human-readable language in English
  def language_of(item)
    ENGLISH_LANGUAGE_NAMES[language_code_of(item)]
  end

  # Returns all articles in the given language
  def articles_in(lang)
    items_in(lang).select { |p| p.kind == 'article' }
  end

  # Translates the given string into the given language
  def t(string, dst_lang)
    # Don't translate English texts
    return string if dst_lang == 'en'

    # Try translating using locales
    # FIXME do not use a global variable
    unless defined?($locales)
      $locales = {}
      Dir['lib/locales/*.yaml'].each do |locale_filename|
        locale_name = locale_filename.sub(%r{^lib/locales/(\w+)\.yaml}, '\1')
        $locales[locale_name.to_sym] = YAML.load_file(locale_filename)
      end
    end
    ($locales[dst_lang.to_sym] || {})[string]
  end

end
