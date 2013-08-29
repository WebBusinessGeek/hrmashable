Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '418496634933769', '74a62ca32fcd3dfa928dfff6912ba4ae'
  provider :google_oauth2, '395375844512.apps.googleusercontent.com', 's4Ns032tOSl8TRjir9GqiQ_L'
  provider :facebook, '194593790719157', 'aa02fe91ebf7be1ce6416e0cab5bf70a'
end