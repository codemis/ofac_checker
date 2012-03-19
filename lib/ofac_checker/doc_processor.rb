# A class for processing an ACH file, and comparing the payees with the OFAC database
#
class DocProcessor
	# grant access to class attributes
	#
	attr_reader :doc, :result_file
	
	# initialize the document processor class
	#
	def initialize(doc, result_location)
		@ach_reader = AchReader.new(doc)
		@doc = doc
		@result_file = File.join(result_location, "#{File.basename(@doc, '.*')}_complete.csv")
	end
	
	# process the document
	#
	def process
	end
	
	# the list of payees
	#
	def payees
		@payees ||= @ach_reader.payees
	end
	
end