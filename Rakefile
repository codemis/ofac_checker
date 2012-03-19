# Requirements
#
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('../db', __FILE__)
require 'ofac_checker'
require 'yaml'
require 'logger'
require 'active_record'
require 'sqlite3'

# Setup ActiveRecord so it does not need Rails
# http://snippets.aktagon.com/snippets/257-How-to-use-ActiveRecord-without-Rails
#
ActiveRecord::Base.logger = Logger.new('log/debug.log')
ActiveRecord::Base.configurations = YAML.load_file(File.join(File.dirname(__FILE__), "config", "database.yml"))
ActiveRecord::Base.establish_connection('development')
# Setup the database
#
require 'schema'

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
		staging_files = Dir.glob("#{staging_dir}/*.ach")
		# update the OFAC database
		#
		#Rake::Task["build"].execute
		DocProcessor.new(staging_files[0], completed_dir).process unless staging_files.empty?
	end

end