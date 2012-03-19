$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'ofac_checker'
require 'yaml'
# get the settings
#
settings = YAML.load_file(File.join(File.dirname(__FILE__), "config/settings.yml"))

task :check_doc do
	staging_files = Dir.glob("#{settings['locations']['staging']}/*.ach")
	DocProcessor.new(staging_files[0]) unless staging_files.empty?
end