module Nanoc::Helpers

  # TODO document
  module Translating

    # TODO document
    class Dictionary

      # TODO document
      def self.from_file_with_name(filename)
        self.new(YAML.load_file(filename))
      end

      # TODO document
      def initialize(hash)
        @hash = hash
      end

      # TODO document
      def [](key)
        @hash[key]
      end

    end

    # TODO document
    def load_translations
      # Don't load translations twice
      return if defined?($translation_dictionaries)

      # Load all translations
      $translation_dictionaries = {}
      Dir['translations/*.yaml'].each do |filename|
        # Get translation name
        language_code = filename.sub(%r{^translations/(\w+)\.yaml}, '\1')

        # Load dictionary
        $translation_dictionaries[language_code] = Dictionary.from_file_with_name(filename)
      end
    end

    # TODO document
    def translate(string, params={})
      # Parse params
      dst_lang = params[:to]

      # Find dictionary
      dictionary = $translation_dictionaries[dst_lang]
      if dictionary.nil?
        warn "No dictionary found for #{dst_lang}"
        return
      end

      # Find translation
      translation = dictionary[string]
      if dictionary.nil?
        warn "No #{dst_lang} translation found for '#{string}'"
        return
      end

      # Done
      translation
    end
    alias_method :t, :translate

  end

end
