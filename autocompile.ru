#!/usr/bin/env ruby

# Load nanoc
$LOAD_PATH.unshift('/Users/ddfreyne/Documents/Development/nanoc/nanoc-3.0.x/lib/')
require 'nanoc3'

# Create autocompiler
site = Nanoc3::Site.new(YAML.load_file('config.yaml'))
autocompiler = Nanoc3::Extra::AutoCompiler.new(site)

# Run
use Rack::ShowExceptions
run autocompiler
