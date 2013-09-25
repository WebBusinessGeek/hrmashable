require 'exception_notification/rails'

ExceptionNotification.configure do |config|
  config.add_notifier :email, {
    :email_prefix => "Exception Details: ",
    :sender_address => %{"Exception Notifier" <notifier@careerthing.com>},
    :exception_recipients => %w{kevw12188@gmail.com jony@idifysolutions.com gagan@idifysolutions.com},
    :delivery_method => :smtp,
    :smtp_settings => {
      :user_name => "myww",
      :password => "myww1234",
      :address => "smtp.sendgrid.net",
      :port => 587,
      :authentication => :plain,
      :enable_starttls_auto => true
    }
  }
end
