module MOULSiteHelpers::Localization

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

  # English strings and their translations in different languages.
  TRANSLATED_STRINGS = {
    'English translation' => {
      'de' => 'Englische Übersetzung',
      'es' => 'Traducción en inglés',
      'fi' => 'Käännös englanniksi',
      'fr' => 'Version anglaise',
      'it' => 'Traduzione Inglese',
      'nl' => 'Engelse vertaling'
    },
    'German translation' => {
      'de' => 'Deutsche Übersetzung',
      'es' => 'Traducción en alemán',
      'fi' => 'Käännös saksaksi',
      'fr' => 'Version allemande',
      'it' => 'Traduzione Tedesca',
      'nl' => 'Duitse vertaling'
    },
    'Spanish translation' => {
      'de' => 'Spanische Übersetzung',
      'es' => 'Traducción en español',
      'fi' => 'Käännös espanjaksi',
      'fr' => 'Version espagnole',
      'it' => 'Traduzione Spagnola',
      'nl' => 'Spaanse vertaling'
    },
    'Finnish translation' => {
      'de' => 'Finnische Übersetzung',
      'es' => 'Traducción en finés',
      'fi' => 'WARNING: untranslated',
      'fr' => 'Version finlandaise',
      'it' => 'Traduzione Finlandese',
      'nl' => 'Finse vertaling'
    },
    'French translation' => {
      'de' => 'Französische Übersetzung',
      'es' => 'Traducción en francés',
      'fi' => 'Käännös ranskaksi',
      'fr' => 'Version française',
      'it' => 'Traduzione Francese',
      'nl' => 'Franse vertaling'
    },
    'Italian translation' => {
      'de' => 'Italienische Übersetzung',
      'es' => 'Traducción en italiano',
      'fi' => 'Käännös italiaksi',
      'fr' => 'Version italienne',
      'it' => 'Traduzione Italiana',
      'nl' => 'Italiaanse vertaling'
    },
    'Dutch translation' => {
      'de' => 'Niederländische Übersetzung',
      'es' => 'Traducción en holandés',
      'fi' => 'Käännös hollanniksi',
      'fr' => 'Version néerlandaise',
      'it' => 'Traduzione Olandese',
      'nl' => 'Nederlandse vertaling'
    },
  }

  # Returns the item's language code
  def language_code_of(item)
    item.language_code || (item.path.match(/^\/(..)\//) || [])[1]
  end

  # Returns the item's human-readable language in English
  def language_of(item)
    ENGLISH_LANGUAGE_NAMES[language_code_of(item)]
  end

  # Returns all articles in the given language
  def articles_in(lang)
    all_items.select { |p| p.kind == 'article' && language_code_of(p) == lang }.sort_by { |a| a.created_at }.reverse
  end

  # Returns the item's translations
  def translations_of(item)
    all_items.select { |p| p.item_id && p.item_id == item.item_id && p.path != item.path }
  end

  # Returns the item's translation in the given language
  def translation_of(item, lang)
    all_items.find { |p| p.item_id == item.item_id && language_code_of(p) == lang }
  end

  # Translates the given string into the given language
  def t(string, dst_lang)
    # Don't translate English texts
    return string if dst_lang == 'en'

    # Translate
    translations = TRANSLATED_STRINGS[string] || {}
    translations[dst_lang] || 'WARNING: untranslated'
  end

  module TimeExtensions

    # Month names in all languages
    MONTH_NAMES = {
      'en' => %w(
        January
        February
        March
        April
        May
        June
        July
        August
        September
        October
        November
        December
      ),
      'nl' => %w(
        januari
        februari
        maart
        april
        mei
        juni
        juli
        augustus
        september
        oktober
        november
        december
      )
    }

    def to_localized_string(lang)
      if lang == 'nl'
        "#{self.mday} #{MONTH_NAMES['nl'][self.mon]} #{self.year}"
      else
        "#{MONTH_NAMES['en'][self.mon]} #{self.mday.ordinal}, #{self.year}"
      end
    end

  end

  class ::Time
    include TimeExtensions
  end

  module NumericExtensions

    def ordinal
      if (10...20).include?(self) then
        self.to_s + 'th'
      else
        self.to_s + %w{th st nd rd th th th th th th}[self % 10]
      end
    end

  end

  class ::Numeric
    include NumericExtensions
  end

end

include MOULSiteHelpers::Localization
