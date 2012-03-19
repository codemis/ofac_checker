require 'spec_helper'

describe DocProcessor do

	describe "#initialize" do
		before(:each) do
			@doc_processor = DocProcessor.new('ach_example.ach', 'spec/files/ach_example.ach')
		end
		
		it "should set the doc file" do
			@doc_processor.doc.nil?.should === false
		end
		
		it "should set the result file" do
			@doc_processor.result_file.nil?.should === false
		end
		
		it "should set result file to ach_example_complete.csv" do
			File.basename(@doc_processor.result_file).should == 'ach_example_complete.csv' 
		end
		
	end
	
	describe "#payees" do
		before(:each) do
			staging_files = Dir.glob("#{SETTINGS['locations']['staging']}/*.ach")
			@doc_processor = DocProcessor.new(staging_files[0], SETTINGS['locations']['completed'])
		end
		
		it { @doc_processor.payees.should include('Mickey Thompson') }
		
		it { @doc_processor.payees.should include('Joe Dokes') }
		
		it { @doc_processor.payees.should include('Lana Turner') }
		
		it { @doc_processor.payees.should include('Harriet Frodenhausen') }
		
		it { @doc_processor.payees.should include('Maxwell Sanduski') }
		
		it { @doc_processor.payees.should include('John Dillinger') }
	end
	
end