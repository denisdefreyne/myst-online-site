module Nanoc::Filters
  class RewriteURLsInHTML < Nanoc::Filter

    identifiers :rewrite_urls_in_html

    def run(content)
      require 'nokogiri'

      # Parse with Hpricot
      doc = Nokogiri::HTML.parse(content)

      # Find a's
      doc.css('a, img, link').each do |elem|
        if elem['href'] =~ /^\//
          elem.set_attribute('href', '/new' + elem['href'])
        end
        if elem['src'] =~ /^\//
          elem.set_attribute('src', '/new' + elem['src'])
        end
      end

      doc.to_html
    end

  end
end
