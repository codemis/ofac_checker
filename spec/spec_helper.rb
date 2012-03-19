$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ofac_checker'
require 'yaml'
# get the settings
#
SETTINGS = YAML.load_file(File.join(File.expand_path('../../config', __FILE__), "settings.yml"))
#Rake::Task["ofac:update_data"].execute