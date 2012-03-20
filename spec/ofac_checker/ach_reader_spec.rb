require 'spec_helper'

describe AchReader do
	
	describe "#initialize" do
		
		it "should set the file to process" do
			reader = AchReader.new('my_file.ach', SETTINGS['file']['ach'])
			reader.file.should == 'my_file.ach'
		end
		
	end
	
	describe "#get_payees" do
		before(:each) do
			staging_files = Dir.glob("#{SETTINGS['locations']['staging']}/*.ach")
			@reader = AchReader.new(staging_files[0], SETTINGS['file']['ach'])
		end
		
		it { @reader.payees.should include('Mickey Thompson') }
		
		it { @reader.payees.should include('Joe Dokes') }
		
		it { @reader.payees.should include('Lana Turner') }
		
		it { @reader.payees.should include('Harriet Frodenhausen') }
		
		it { @reader.payees.should include('Maxwell Sanduski') }
		
		it { @reader.payees.should include('John Dillinger') }
		
	end
	
end