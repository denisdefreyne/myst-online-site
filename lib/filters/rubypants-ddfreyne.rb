module Nanoc::Filters
  class RubyPantsDdfreyne < Nanoc::Filter

    identifier :rubypants_ddfreyne

    def run(content)
      german = (language_code_of(defined?(@item) ? @item : (assigns[:item] || assigns[:page])) == 'de')

      ::RubyPantsDdfreyne.new(
        content,
        [ german ? :german_quotes : :quotes, :ellipses, :backticks, :oldschool ]
      ).to_html
    end

  end
end
