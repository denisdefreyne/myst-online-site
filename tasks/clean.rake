require 'nanoc3'

task :clean do
  # Load site
  site = Nanoc3::Site.new(YAML.load_file('config.yaml'))
  site.load_data

  # Build and map reps
  site.compiler.instance_eval { @items = @site.items }
  site.compiler.load_rules
  site.compiler.build_reps
  site.compiler.instance_eval { @reps = @items.map { |i| i.reps }.flatten }
  site.compiler.map_reps

  # Remove compiled files
  site.items.each do |item|
    item.reps.each do |rep|
      FileUtils.rm_f rep.raw_path
    end
  end
end
