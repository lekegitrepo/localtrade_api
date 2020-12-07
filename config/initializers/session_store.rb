if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_local_trade', domain: 'https://localtradeapi.herokuapp.com/', secure: true, same_site: :none
else
  Rails.application.config.session_store :cookie_store, key: '_local_trade', same_site: :none, secure: true
end
