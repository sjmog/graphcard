gem 'dotenv-rails', require: 'dotenv/rails-now'

Twilio.configure do |config|
  config.account_sid = ENV["TWILIO_ACCOUNT_SID"]
  config.auth_token = ENV["TWILIO_AUTH_TOKEN"]
end