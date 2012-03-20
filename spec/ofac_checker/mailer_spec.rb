describe Mailer do
	
	before(:each) do
		Mail::TestMailer.deliveries.clear
		@mailer = Mailer.new
		@mailer.task_complete(SETTINGS['email_smtp'], File.join(File.expand_path(File.join('../../'), __FILE__), "files", "attachments", "test.csv"), 10)
	end
	
	it "should send the user an email" do
		Mail::TestMailer.deliveries.length.should == 1
	end
	
	it { should have_sent_email.to(SETTINGS['email_smtp']['to']) }
	
end