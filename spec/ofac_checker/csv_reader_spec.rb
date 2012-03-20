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
		
		it { @reader.payees.should include('Melinda Boyd') }
		
		it { @reader.payees.should include('Judith Breneman') }
		
		it { @reader.payees.should include('Daniel Case') }
		
		it { @reader.payees.should include('Dennis Shelly') }
		
		it { @reader.payees.should include('Jeffrey Walker') }
		
		it { @reader.payees.should include('Taeko Hiraga') }
		
	end
	
	describe "#get_payees with reversed name structure" do
		before(:each) do
			staging_files = Dir.glob("#{SETTINGS['locations']['staging']}/*.csv")
			SETTINGS['file']['csv']['name_structure'] = 'first_last'
			@reader = CsvReader.new(staging_files[0], SETTINGS['file']['csv'])
		end
		
		it { @reader.payees.should include('Boyd Melinda') }
		
		it { @reader.payees.should include('Breneman Judith') }
		
		it { @reader.payees.should include('Case Daniel') }
		
		it { @reader.payees.should include('Shelly Dennis') }
		
		it { @reader.payees.should include('Walker Jeffrey') }
		
		it { @reader.payees.should include('Hiraga Taeko') }
		
	end
	
end