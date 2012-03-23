# reads a .csv file
#
class CsvReader
	# attributes
	#
	attr_reader :file
	
	# initialize the class
	#
	def initialize(file, settings)
		@file = file
		@settings = settings
	end
	
	def payees
		@payees ||= get_payees
	end
	
	private
		# get the payees
		#
		def get_payees
			payees = []
			csv = CSV.read(@file, :headers => true, :return_headers => true)
			payee_column = csv["#{@settings['name_header']}"]
			payee_column.each do |row|
				payees.push "#{row.downcase.strip.gsub(/\b\w/){$&.upcase}}" if row != @settings['name_header']
			end
			payees
		end
	
end