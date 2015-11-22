Capybara.asset_host = 'http://localhost:3000'
Capybara::Webkit.configure do |config|
  config.allow_url('www.google.com')
  config.allow_url('fonts.googleapis.com')
  config.allow_url('ajax.googleapis.com')
  config.allow_url('www.gstatic.com')
  config.allow_url('image.tmdb.org')
end
