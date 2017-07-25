Marvel.configure do |config|
  config.api_key     = ENV['MARVEL_API_KEY']
  config.private_key = ENV['MARVEL_PRIVATE_KEY']
end