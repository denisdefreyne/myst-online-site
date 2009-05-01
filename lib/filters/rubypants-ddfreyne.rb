module Nanoc3::Filters
  class RubyPantsDdfreyne < Nanoc3::Filter

    identifier :rubypants_ddfreyne

    def run(content, params={})
      german = (language_code_of(defined?(@item) ? @item : (assigns[:item] || assigns[:page])) == 'de')

      ::RubyPantsDdfreyne.new(
        content,
        [ german ? :german_quotes : :quotes, :ellipses, :backticks, :oldschool ]
      ).to_html
    end

  end
end
