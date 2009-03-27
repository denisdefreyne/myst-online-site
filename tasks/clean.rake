require 'nanoc'

task :clean do
  site = Nanoc::Site.new(YAML.load_file('config.yaml'))
  site.load_data

  (site.pages + site.assets).each do |p|
    p.reps.each do |r|
      FileUtils.rm_f r.disk_path
    end
  end
end
