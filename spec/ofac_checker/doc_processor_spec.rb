require 'spec_helper'

describe DocProcessor do

	describe "#initialize" do
		before(:each) do
			@doc_processor = DocProcessor.new('ach_example.ach', 'spec/files/ach_example.ach')
		end
		
		it "should set the doc file" do
			@doc_processor.doc.nil?.should === false
		end
		
	end
	
end