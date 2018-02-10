Rollbar.configure do |config|

  config.access_token = ENV['ROLLBAR_ACCESS_TOKEN']

  if Rails.env.test? || Rails.env.development?
    config.enabled = false
  end

  config.environment = ENV['ROLLBAR_ENV'].presence || Rails.env
end
