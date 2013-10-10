Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '418496634933769', '74a62ca32fcd3dfa928dfff6912ba4ae'
  provider :google_oauth2, '395375844512-simgo3nj99nkgt9iafgsf3pt1kqjrjm1.apps.googleusercontent.com', '8lzzK-G7BG8PjZPPhk3yj4Pd'
  provider :facebook, '201431176692413', '6ab5d86aa6de69e6ab69c324fc6212dd'
end