# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

# Helpers - built-in
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::XMLSitemap

# Returns the asset with the given asset ID.
def asset(asset_id)
  @assets.find { |asset| asset.asset_id == asset_id }
end

# Returns the page's language
def page_lang(page=@page)
  page.path[1..2]
end

# Returns all articles in the given language
def articles(language)
  @pages.select { |p| p.kind == 'article' && page_lang(p) == language }.sort_by { |a| a.created_at }.reverse
end

class Fixnum

  def to_mon_s
    Date::MONTHNAMES[self]
  end

  def to_abbr_mon_s
    Date::ABBR_MONTHNAMES[self]
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
