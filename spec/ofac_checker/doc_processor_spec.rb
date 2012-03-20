require 'spec_helper'

describe DocProcessor do

	describe "#initialize" do
		before(:each) do
			@doc_processor = DocProcessor.new('ach_example.ach', 'spec/files/ach_example.ach', SETTINGS)
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
			@doc_processor = DocProcessor.new(staging_files[0], SETTINGS['locations']['completed'], SETTINGS)
		end
		
		it { @doc_processor.payees.should include('Mickey Thompson') }
		
		it { @doc_processor.payees.should include('Joe Dokes') }
		
		it { @doc_processor.payees.should include('Lana Turner') }
		
		it { @doc_processor.payees.should include('Harriet Frodenhausen') }
		
		it { @doc_processor.payees.should include('Maxwell Sanduski') }
		
		it { @doc_processor.payees.should include('John Dillinger') }
	end
	
	describe "#process" do
		
		before(:each) do
			staging_files = Dir.glob("#{SETTINGS['locations']['staging']}/*.ach")
			@doc_processor = DocProcessor.new(staging_files[0], SETTINGS['locations']['completed'], SETTINGS)
			@doc_processor.process
		end
		
		it "should create a result file" do
			Dir.glob("#{SETTINGS['locations']['completed']}/*.csv").empty?.should === false
		end
		
		it "should have the correct result file name" do
			Dir.glob("#{SETTINGS['locations']['completed']}/*.csv").include?(@doc_processor.result_file).should === true
		end
		
	end
	
	describe "final CSV" do
		before(:each) do
			staging_files = Dir.glob("#{SETTINGS['locations']['staging']}/*.ach")
			@doc_processor = DocProcessor.new(staging_files[0], SETTINGS['locations']['completed'], SETTINGS)
			@doc_processor.process
			@payee_array = []
			CSV.foreach("#{@doc_processor.result_file}") do |row|
			    @payee_array.push row[0]
			end
		end
		
		it { @payee_array.should include('Mickey Thompson') }
		
		it { @payee_array.should include('Joe Dokes') }
		
		it { @payee_array.should include('Lana Turner') }
		
		it { @payee_array.should include('Harriet Frodenhausen') }
		
		it { @payee_array.should include('Maxwell Sanduski') }
		
		it { @payee_array.should include('John Dillinger') }
		
	end
	
	describe "#cleanup" do
		
		it "should remove the source file from the staging directory" do
			staging_files = Dir.glob("#{SETTINGS['locations']['staging']}/*.ach")
			@doc_processor = DocProcessor.new(staging_files[0], SETTINGS['locations']['completed'], SETTINGS)
			@doc_processor.cleanup
			Dir.glob("#{SETTINGS['locations']['staging']}/*.ach").empty?.should === true
		end
		
	end
	
end