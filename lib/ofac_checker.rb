$LOAD_PATH.unshift File.expand_path(File.join('..', '..', 'db'), __FILE__)
require 'yaml'
require 'logger'
require 'active_record'
require 'mysql'
require 'tempfile'
require 'csv'
require 'fileutils'
require 'mail'

# Setup ActiveRecord so it does not need Rails
# http://snippets.aktagon.com/snippets/257-How-to-use-ActiveRecord-without-Rails
#
ActiveRecord::Base.logger = Logger.new(File.join('log','debug.log'))
ActiveRecord::Base.configurations = YAML.load_file(File.join(File.expand_path(File.join('..', '..','config'), __FILE__), "database.yml"))
ActiveRecord::Base.establish_connection('development')
# Setup the database
#
require 'schema'
require 'ofac'
require 'ofac_checker/ach_reader'
require 'ofac_checker/csv_reader'
require 'ofac_checker/doc_processor'
require 'ofac_checker/mailer'