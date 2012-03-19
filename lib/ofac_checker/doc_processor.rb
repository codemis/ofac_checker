# A class for processing an ACH file, and comparing the payees with the OFAC database
#
class DocProcessor
	
	# initialize the document processor class
	#
	def initialize(doc, result_location)
		@doc = doc
		@result_file = File.join(result_location, "#{File.basename(@doc, '.*')}_complete.csv")
		puts @result_file
	end
	
end