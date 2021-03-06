$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ofac_checker'
require 'yaml'
# get the settings
#
SETTINGS = YAML.load_file(File.join(File.expand_path(File.join('..'), __FILE__), "files", "config", "settings.yml"))
Rake::Task["ofac:update_data"].execute
# mailer in test method
#
Mail.defaults do
  delivery_method :test
end
include Mail::Matchers

RSpec.configure do |config|
	
	config.before(:each) do
		completed_ach_file = File.join("#{SETTINGS['locations']['completed']}", "example.ach")
		FileUtils.mv(completed_ach_file, File.join("#{SETTINGS['locations']['staging']}", "example.ach")) if File.exists?(completed_ach_file)
		completed_csv_file = File.join("#{SETTINGS['locations']['completed']}", "example.csv")
		FileUtils.mv(completed_csv_file, File.join("#{SETTINGS['locations']['staging']}", "example.csv")) if File.exists?(completed_csv_file)
	end
	
end