require 'spec_helper'

describe CsvReader do
	
	describe "#initialize" do
		
		it "should set the file to process" do
			reader = CsvReader.new('my_file.ach', SETTINGS['file']['csv'])
			reader.file.should == 'my_file.ach'
		end
		
	end
	
	describe "#get_payees" do
		before(:each) do
			staging_files = Dir.glob("#{SETTINGS['locations']['staging']}/*.csv")
			@reader = CsvReader.new(staging_files[0], SETTINGS['file']['csv'])
		end
		
		it { @reader.payees.should include('Kalule Charles') }
		
		it { @reader.payees.should include('Boyd Melinda') }
		
		it { @reader.payees.should include('Mcintyre Brian') }
		
		it { @reader.payees.should include('Ebel Martin') }
		
		it { @reader.payees.should include('Geiss Michael') }
		
		it { @reader.payees.should include('Vance Steven') }
		
	end
	
end