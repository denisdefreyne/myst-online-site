# Returns the page's language
def page_lang(page=@page)
  page.path[1..2]
end

# Returns all articles in the given language
def articles(lang)
  @pages.select { |p| p.kind == 'article' && page_lang(p) == lang }.sort_by { |a| a.created_at }.reverse
end

# Returns the page's translations
def translations(page=@page)
  @pages.select { |p| p.page_id == page.page_id && p.path != page.path }
end

# Returns the page's translation in the given language
def translation(page, lang)
  @pages.find { |p| p.page_id == page.page_id && page_lang(p) == lang }
end

# Returns the page's english translation
def english_translation_of(page)
  translation(page, 'en')
end

# Returns the name of the language with the given code
def lang_code_to_name(lang_code)
  {
    'en' => 'English',
    'nl' => 'Dutch'
  }[lang_code]
end

class Time

  MONTHNAMES_ENGLISH = %w(
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
  )

  MONTHNAMES_DUTCH = %w(
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

  def to_localized_string(lang)
    if lang == 'nl'
      "#{self.mday} #{Time::MONTHNAMES_DUTCH[self.mon]} #{self.year}"
    else
      "#{Time::MONTHNAMES_ENGLISH[self.mon]} #{self.mday.ordinal}, #{self.year}"
    end
  end

end

class Numeric

  def ordinal
    if (10...20).include?(self) then
      self.to_s + 'th'
    else
      self.to_s + %w{th st nd rd th th th th th th}[self % 10]
    end
  end

end
