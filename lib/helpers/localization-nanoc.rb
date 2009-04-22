module Nanoc::Helpers

  # TODO document
  #
  # Requires language_code_of(item) and canonical_identifier_of(item) to be implemented.
  module Localization

    # TODO document
    def items_in(language_code)
      all_items.select { |i| language_code_of(i) == language_code }
    end

    # TODO document
    def translations_of(item)
      all_items.select { |i| !language_code_of(i).nil? && canonical_identifier_of(i) == canonical_identifier_of(item) && i.path != item.path }
    end

    # TODO document
    def translation_of(item, params={})
      translations_of(item).find { |i| language_code_of(i) == params[:in] }
    end

  end

end
