module Nanoc3::Helpers

  # TODO document
  #
  # Requires language_code_of(item) and canonical_identifier_of(item) to be implemented.
  module Localization

    # TODO document
    def items_in(language_code)
      @items.select { |i| language_code_of(i) == language_code }
    end

    # TODO document
    def translations_of(item)
      @items.select do |i|
        language_code_of(i) &&
        canonical_identifier_of(i) &&
        canonical_identifier_of(i) == canonical_identifier_of(item) &&
        i.identifier != item.identifier
      end
    end

    # TODO document
    def translation_of(item, params={})
      translations_of(item).find { |i| language_code_of(i) == params[:in] }
    end

  end

end
