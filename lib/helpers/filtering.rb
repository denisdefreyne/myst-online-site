module Nanoc::Helpers

  module Filtering

    def filter(filter_name, &block)
      # Capture block
      data = capture(&block)

      # Find filter
      filter = Nanoc::Filter.named(filter_name).new(@_obj_rep)

      # Filter captured data
      filtered_data = filter.run(data)

      # Append filtered data to buffer
      buffer = eval('_erbout', block.binding)
      buffer << filtered_data
    end

  private

    def capture(*args, &block)
      buffer = eval('_erbout', block.binding)

      pos = buffer.length
      block.call(*args)

      data = buffer[pos..-1]

      buffer[pos..-1] = ''

      data
    end

  end

end
