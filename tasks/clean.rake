require 'nanoc3'

task :clean do
  # Load site
  site = Nanoc3::Site.new(YAML.load_file('config.yaml'))
  site.load_data

  # Remove compiled files
  site.items.each do |item|
    item.reps.each do |rep|
      FileUtils.rm_f rep.raw_path
    end
  end
end
