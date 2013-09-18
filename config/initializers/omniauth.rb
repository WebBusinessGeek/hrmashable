Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '418496634933769', '74a62ca32fcd3dfa928dfff6912ba4ae'
  provider :google_oauth2, '395375844512.apps.googleusercontent.com', 's4Ns032tOSl8TRjir9GqiQ_L'
  provider :facebook, '467432370021961', 'c38af272e519cb2f352351d417999f5'
end