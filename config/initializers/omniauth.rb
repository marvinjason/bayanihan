Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :twitter, "54x3SwonLjaAsAQa0k8zo2E9H", "ZVzDwOre2zMobzl5lAIWRdg1d7QfI6pXnci1GtT3d2qa0HhpZh"
end