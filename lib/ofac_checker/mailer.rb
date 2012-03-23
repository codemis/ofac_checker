# contacts the user by email
#
class Mailer
	
	# Send the task complete email.  Make sure to .deliver it
	#
  def task_complete(settings, completed_file, hits)
		mail = Mail.new do
		  from     'no-reply@localhost.com'
		  to       settings['to']
		  subject  "#{settings['subject']} - #{hits} Hits"
		  body     File.read(File.join(File.dirname(__FILE__), 'mail_templates', 'task_complete.txt'))
		  add_file :filename => 'results.csv', :content => File.read(completed_file) if hits != 0
		end
		# Mail.defaults do
		#   delivery_method :smtp, :address    => settings['address'],
		#                           :port       => settings['port'],
		#                           :user_name  => settings['user_name'],
		#                           :password   => settings['password'],
		#                           :enable_ssl => true
		# end
		mail.deliver
  end

end