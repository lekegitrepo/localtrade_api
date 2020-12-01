if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_local_trade', domain: ''
else
  Rails.application.config.session_store :cookie_store, key: '_local_trade'
end
