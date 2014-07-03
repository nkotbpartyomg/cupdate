# Load the Rails application.
require File.expand_path('../application', __FILE__)


  config.action_mailer.default_url_options = { :host => '107.170.11.134' }
config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_deliveries = true

  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 25,
    domain: "gmail.com",
    authentication: "plain",
    user_name: "cupdater@gmail.com",
    password: "9$217YkbF913W4b",
    enable_starttls_auto: true
  }

# Initialize the Rails application.
Rails.application.initialize!
