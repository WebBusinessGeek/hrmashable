Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '418496634933769', '74a62ca32fcd3dfa928dfff6912ba4ae'
  provider :google_oauth2, '395375844512.apps.googleusercontent.com', 's4Ns032tOSl8TRjir9GqiQ_L'
  provider :facebook, '201431176692413', '6ab5d86aa6de69e6ab69c324fc6212dd'
end