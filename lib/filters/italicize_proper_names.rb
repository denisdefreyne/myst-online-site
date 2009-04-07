module MOULSiteFilters

  class ItalicizeProperNamesFilter < Nanoc::Filter

    identifier :italicize_proper_names

    WORDS = [
      'Yeesha',
      'Marie Sutherland',
      'Atrus',
      'Cate Alexander',
      'Minkata',
      'K\'veer',
      'Ahnonay Cathedral',
      'Ahnonay',
      'Rose Taylor',
      'Wheely Engberg',
      'Wheely',
      'Michael Engberg',
      'Negilahn',
      'Douglas Sharper',
      'Sharper',
      'Phil Henderson',
      'Dr. Watson',
      'Cyan Worlds, Inc.',
      'Cyan Worlds',
      'CyanChat',
      'Cyan',
      'Mudpie',
      'Untìl Uru',
      'Myst Online: Uru Live',
      'Myst Online: Restauration de l\'Expérience',
      'Myst Online: Esperimento di Restaurazione',
      'Myst Online: Restaurationsexperiment',
      'Myst Online: Restauratie-experiment',
      'Myst Online: Restoration Experiment',
      '"Myst Online"',
      'Myst Online',
      'MystOnline.com',
      'Myst: Das Buch Atrus',
      'Myst: Das Buch Ti\'ana',
      'Myst: Das Buch der D\'ni',
      'Myst: le livre d\'Atrus',
      'Myst: le livre de Ti\'ana',
      'Myst: le livre de D\'ni',
      'Myst: El Libro de Atrus',
      'Myst: El Libro de Ti\'ana',
      'Myst: El Libro de D\'ni',
      'Myst: The Book of Atrus',
      'Myst: The Book of Ti\'ana',
      'Myst: The Book of D\'ni',
      'MYSTlore',
      'The Myst Reader',
      'Myst',
      '"Uru Live"',
      'Uru Live',
      'Uru: Ages Beyond Myst',
      'Uru: To D\'ni',
      'Uru: The Path Of The Shell',
      'Uru',
      'MORE',
      'MO:UL',
      'Reteltee',
      'D\'ni Guild Advisor',
      'D\'ni Guilds',
      'D\'ni Restoration Council',
      'DRC',
      'D\'ni',
      'Riven',
      'GameTap',
      'Plasma20',
      'Plasma',
      '3ds Max',
      'Guild of Maintainers',
      'Guild of Messengers',
      'Guild of Writers',
      'Gilda dei Mantenitori',
      'Gilda dei Messaggeri',
      'Gilda degli Scrittori',
      'Guilde de la Maintenance',
      'Guilde des Messagers',
      'Guilde des Ecrivains'
    ]

    def run(content)
      @regex ||= Regexp.union(*[ /<h\d>/, /<\/h\d>/, /</, />/, WORDS.map { |w| Regexp.new('\b' + Regexp.escape(w) + '\b') }].flatten)

      inside_element = false
      inside_header  = false

      content_new = content.gsub(@regex) do |match|
        if match == '<'
          inside_element = true
          match
        elsif match == '>'
          inside_element = false
          match
        elsif match =~ /<h\d>/
          inside_header = true
          match
        elsif match =~ /<\/h\d>/
          inside_header = false
          match
        else
          inside_element || inside_header ? match : "<i>#{match}</i>"
        end
      end

      content_new
    end

  end

end
