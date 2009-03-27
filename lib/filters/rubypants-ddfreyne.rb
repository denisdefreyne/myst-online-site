module Nanoc::Filters
  class RubyPantsDdfreyne < Nanoc::Filter

    identifier :rubypants_ddfreyne

    def run(content)
      german = @page.path[1..2] == 'de'

      ::RubyPantsDdfreyne.new(
        content,
        [ german ? :german_quotes : :quotes, :ellipses, :backticks, :oldschool ]
      ).to_html
    end

  end
end
