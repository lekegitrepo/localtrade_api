if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, {
    :key => '_application_session',
    :domain => :all,
    :same_site => :none,
    :secure => :true
  } # key: '_local_trade', domain: 'https://localtradeapi.herokuapp.com/', same_site: false, secure: true
else
  Rails.application.config.session_store :cookie_store, key: '_local_trade'#, same_site: :none, secure: true
end
