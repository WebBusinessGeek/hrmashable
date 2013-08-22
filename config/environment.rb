# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HRResourceToday::Application.initialize!

# HRResourceToday::Application.config.middleware.use ExceptionNotification::Rack, :email => {
#   :email_prefix => "Exception Details: ",
#   :sender_address => %{"Exception Notifier" <notifier@grabsell.com>},
#   :exception_recipients => %w{kevw12188@gmail.com jony@idifysolutions.com}
# }