module Nanoc::Filters
  class RewriteURLsInCSS < Nanoc::Filter

    identifiers :rewrite_urls_in_css

    def run(content)
      content.gsub('url(/', 'url(/new/')
    end

  end
end
