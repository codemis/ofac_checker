# Requirements
#
$LOAD_PATH.unshift File.expand_path(File.join('..', 'lib'), __FILE__)
require 'yaml'
require 'ofac_checker'
# get the settings
#
settings_file = File.join(File.dirname(__FILE__), "config", "settings.yml")
settings = File.exist?(settings_file) ? YAML.load_file(settings_file) : nil

namespace :ofac_checker do

	task :process do
		# Set Settings
		#
		staging_dir = settings.nil? ? File.join(File.dirname(__FILE__), "file_bin", "staging") : settings['locations']['staging']
		completed_dir = settings.nil? ? File.join(File.dirname(__FILE__), "file_bin", "completed") : settings['locations']['completed']
		staging_files = Dir.glob("#{staging_dir}/*.{csv,ach}")
		# update the OFAC database
		#
		unless staging_files.empty?
			Rake::Task["ofac:update_data"].execute
			DocProcessor.new(staging_files[0], completed_dir, settings).process
		end
	end

end