# Helpers - built-in
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::HTMLEscape
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Render
include Nanoc::Helpers::XMLSitemap

# Module in which all MO:UL site-specific helpers reside
module MOULSiteHelpers

  # Returns the asset with the given asset ID.
  def asset(asset_id)
    @assets.find { |asset| asset.asset_id == asset_id }
  end

end

include MOULSiteHelpers
