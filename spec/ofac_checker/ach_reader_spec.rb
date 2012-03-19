require 'spec_helper'

describe AchReader do
	
	describe "#initialize" do
		
		it "should set the file to process" do
			ach_reader = AchReader.new('my_file.ach')
			ach_reader.file.should == 'my_file.ach'
		end
		
	end
	
	describe "#get_payees" do
		before(:each) do
			staging_files = Dir.glob("#{SETTINGS['locations']['staging']}/*.ach")
			@ach_reader = AchReader.new(staging_files[0])
		end
		
		it { @ach_reader.payees.should include('Mickey Thompson') }
		
		it { @ach_reader.payees.should include('Joe Dokes') }
		
		it { @ach_reader.payees.should include('Lana Turner') }
		
		it { @ach_reader.payees.should include('Harriet Frodenhausen') }
		
		it { @ach_reader.payees.should include('Maxwell Sanduski') }
		
		it { @ach_reader.payees.should include('John Dillinger') }
		
	end
	
end