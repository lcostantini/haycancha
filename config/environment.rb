# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',
  user_name:            ENV["USR_NAME"],
  password:             ENV["PSW_EMAIL"],
  authentication:       'plain',
  enable_starttls_auto: true  }
  
