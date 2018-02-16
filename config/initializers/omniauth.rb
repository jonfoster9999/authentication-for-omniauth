Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Figaro.env.facebook_key, Figaro.env.facebook_secret
end
