Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['STRONGERAPP_TWITTER_KEY'], ENV['STRONGERAPP_TWITTER_SECRET_KEY']
end
