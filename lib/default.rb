# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

# Helpers - built-in
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::XMLSitemap

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
