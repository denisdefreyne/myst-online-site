module MOULSiteFilters

  class ItalicizeProperNamesFilter < Nanoc3::Filter

    identifier :italicize_proper_names

    WORDS = [
      '"Myst Online"',
      '"Uru Live"',
      '3ds Max',
      'Ahnonay Cathedral',
      'Ahnonay',
      'Atrus',
      'Cate Alexander',
      'Cyan Worlds, Inc.',
      'Cyan Worlds',
      'Cyan',
      'CyanChat',
      'Douglas Sharper',
      'Dr. Watson',
      'DRC',
      'D\'ni Guild Advisor',
      'D\'ni Guilds',
      'D\'ni Restoration Council',
      'D\'ni',
      'GameTap',
      'Gilda degli Scrittori',
      'Gilda dei Mantenitori',
      'Gilda dei Messaggeri',
      'Guild of Maintainers',
      'Guild of Messengers',
      'Guild of Writers',
      'Guilde de la Maintenance',
      'Guilde des Ecrivains',
      'Guilde des Messagers',
      'K\'veer',
      'Marie Sutherland',
      'Michael Engberg',
      'Minkata',
      'MO:UL',
      'MORE',
      'Mudpie',
      'Myst Online: Esperimento di Restaurazione',
      'Myst Online: Restauratie-experiment',
      'Myst Online: Restauration de l\'Expérience',
      'Myst Online: Restaurationsexperiment',
      'Myst Online: Restoration Experiment',
      'Myst Online: Uru Live',
      'Myst Online',
      'Myst',
      'Myst: Das Buch Atrus',
      'Myst: Das Buch der D\'ni',
      'Myst: Das Buch Ti\'ana',
      'Myst: El Libro de Atrus',
      'Myst: El Libro de D\'ni',
      'Myst: El Libro de Ti\'ana',
      'Myst: le livre de D\'ni',
      'Myst: le livre de Ti\'ana',
      'Myst: le livre d\'Atrus',
      'Myst: The Book of Atrus',
      'Myst: The Book of D\'ni',
      'Myst: The Book of Ti\'ana',
      'MYSTlore',
      'MystOnline.com',
      'Negilahn',
      'Phil Henderson',
      'Plasma20',
      'Plasma',
      'Reteltee',
      'Riven',
      'Rose Taylor',
      'Sharper',
      'The Myst Reader',
      'Untìl Uru',
      'Uru Live',
      'Uru: Ages Beyond Myst',
      'Uru: The Path Of The Shell',
      'Uru: To D\'ni',
      'Uru',
      'Wheely Engberg',
      'Wheely',
      'Yeesha',
    ]

    def run(content, params={})
      @regex ||= begin
        regexp_parts = [
          /\<h\d\>/, /\<\/h\d\>/,
          '<i>',     '</i>',
          '<',       '>',
          WORDS.map { |w| Regexp.new('\b' + Regexp.escape(w) + '\b') }
        ].flatten
        Regexp.union(*regexp_parts)
      end

      inside_element = false
      inside_header  = false
      inside_italic  = false

      content_new = content.gsub(@regex) do |match|
        case match
        when '<'
          inside_element = true
          match
        when '>'
          inside_element = false
          match
        when '<i>'
          inside_italic = true
          match
        when '</i>'
          inside_italic = false
          match
        when /<h\d>/
          inside_header = true
          match
        when /<\/h\d>/
          inside_header = false
          match
        else
          inside_element || inside_header || inside_italic ? match : "<i>#{match}</i>"
        end
      end

      content_new
    end

  end

end
