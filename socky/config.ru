require 'socky/server'

options = {
  debug: true,
  applications: {
    to_do: 'to_do_secret_123'
  }
}

map '/websocket' do
  run Socky::Server::WebSocket.new options
end

map '/http' do
  use Rack::CommonLogger
  run Socky::Server::HTTP.new options
end
