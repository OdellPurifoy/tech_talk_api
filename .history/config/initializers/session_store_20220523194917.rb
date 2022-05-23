if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_tech_talk_api', domain: 'tech-talk-api-json-api'
  else
    Rails.application.config.session_store :cookie_store, key: '_tech_talk_api'
end