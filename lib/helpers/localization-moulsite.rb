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

  # Maps (possibly translated) identifiers onto their canonical identifier (in
  # English in this case, but does not have to be).
  CANONICAL_IDENTIFIER_MAPPING = {
    'en' => {
      '/'                   => '/',
      '/play/'              => '/play/',
      '/about/'             => '/about/',
      '/about/news/'        => '/about/news/',
      '/media/'             => '/media/',
      '/media/screenshots/' => '/media/screenshots/',
      '/media/concept-art/' => '/media/concept-art/',
      '/developers/'        => '/developers/'
    },
    'de' => {
      '/'                   => '/',
      '/play/'              => '/spielen/',
      '/about/'             => '/info/',
      '/about/news/'        => '/info/news/',
      '/media/'             => '/medien/',
      '/media/screenshots/' => '/medien/screenshots/',
      '/media/concept-art/' => '/medien/concept-art/',
      '/developers/'        => '/entwickler/'
    },
    'es' => {
      '/'                   => '/',
      '/play/'              => '/jugar/',
      '/about/'             => '/info/',
      '/about/news/'        => '/info/noticias/',
      '/media/'             => '/galeria/',
      '/media/screenshots/' => '/galeria/capturas/',
      '/media/concept-art/' => '/galeria/arte-conceptual/',
      '/developers/'        => '/desarrolladores/'
    },
    'fi' => {
      '/'                   => '/',
      '/play/'              => '/pelaa/',
      '/about/'             => '/tietoa/',
      '/about/news/'        => '/tietoa/uutisia/',
      '/media/'             => '/media/',
      '/media/screenshots/' => '/media/kuvakaappauksia/',
      '/media/concept-art/' => '/media/luonnoksia/',
      '/developers/'        => '/tuotekehittelijat/'
    },
    'fr' => {
      '/'                   => '/',
      '/play/'              => '/jouez/',
      '/about/'             => '/informations/',
      '/about/news/'        => '/informations/nouvelles/',
      '/media/'             => '/medias/',
      '/media/screenshots/' => '/medias/captures-d-ecran/',
      '/media/concept-art/' => '/medias/concepts-artistiques/',
      '/developers/'        => '/developpeurs/'
    },
    'it' => {
      '/'                   => '/',
      '/play/'              => '/gioca/',
      '/about/'             => '/informazioni/',
      '/about/news/'        => '/informazioni/notizie/',
      '/media/'             => '/media/',
      '/media/screenshots/' => '/media/immagini/',
      '/media/concept-art/' => '/media/concept-art/',
      '/developers/'        => '/sviluppatori/'
    },
    'nl' => {
      '/'                   => '/',
      '/play/'              => '/speel/',
      '/about/'             => '/over/',
      '/about/news/'        => '/over/nieuws/',
      '/media/'             => '/media/',
      '/media/screenshots/' => '/media/schermafbeeldingen/',
      '/media/concept-art/' => '/media/ontwerpschetsen/',
      '/developers/'        => '/ontwikkelaars/'
    }
  }

  # RequiredMethods contains methods required by Nanoc3::Helpers::Localization.
  module RequiredMethods

    # Returns the language_code attribute, or, if the former is nil, the
    # language code derived from the path.
    def language_code_of(item)
      (item.identifier.match(/^\/([a-z]{2})\//) || [])[1]
    end

    # Returns the item_id attribute of the given item.
    def canonical_identifier_of(item)
      language_code   = language_code_of(item)
      pure_identifier = item.identifier[/^\/[a-z]{2}(\/.*)/, 1]

      (CANONICAL_IDENTIFIER_MAPPING[language_code] || {}).invert[pure_identifier]
    end

  end

  include RequiredMethods

  # Returns the item's human-readable language in English
  def language_of(item)
    ENGLISH_LANGUAGE_NAMES[language_code_of(item)]
  end

  # Returns all articles in the given language
  def articles_in(lang)
    parent_item_path = '/' + lang + (CANONICAL_IDENTIFIER_MAPPING[lang]['/about/news/']) 
    articles_below(parent_item_path)
  end

end
