# Link Nanoc and Nanoc3
Nanoc = Nanoc3 unless defined?(Nanoc)
Nanoc3 = Nanoc unless defined?(Nanoc3)

# Returns the current page or item that is being compiled
def this_item
  defined?(@item) ? @item : (@page || @asset)
end

# Returns all items
def all_items
  defined?(@items) ? @items : (@pages + @assets)
end
