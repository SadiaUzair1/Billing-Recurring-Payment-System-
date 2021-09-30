# frozen_string_literal: true


# Load the Rails application.
require_relative 'application'
Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  host = 'localhost:3000'
  config.action_mailer.default_url_options = { host: host }
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    user_name: 'sadia.uzair@devsinc.com',
    password: 'irjarotfbgxhzxfi',
    # user_name: Rails.application.credentials.master.fetch(:user_name),
    # password: Rails.application.credentials.master.fetch(:password),
    authentication: 'plain',
    enable_starttls_auto: true
  }
end
# Initialize the Rails application.
Rails.application.initialize!
