Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :facebook, '418496634933769', '74a62ca32fcd3dfa928dfff6912ba4ae'
    provider :google, '395375844512.apps.googleusercontent.com', 's4Ns032tOSl8TRjir9GqiQ_L'
  end
end