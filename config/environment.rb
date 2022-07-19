# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  port: 587,
  address: 'smtp.sendgrid.net',
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY'],
  domain: 'powerful-sands-05753.herokuapp.com',
  authentication: :plain,
  enable_starttls_auto: true
}
