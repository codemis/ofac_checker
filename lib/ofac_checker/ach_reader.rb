# reads a .ach file
#
class AchReader
	# attributes
	#
	attr_reader :file
	
	# initialize the class
	#
	def initialize(file)
		@file = file
	end
	
	def payees
		@payees ||= get_payees
	end
	
	private
		# get the payees
		#
		def get_payees
			payees = []
			File.open(@file, 'r') do |f1|
				while line = f1.gets
					if line[54] =~ /[a-z]/i && line[53] =~ /\s/
						payees.push line[54..75].downcase.gsub(/\b\w/){$&.upcase}.strip!
					end 
				end
			end
			payees
		end
	
end