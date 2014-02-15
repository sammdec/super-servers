require 'rubygems'
require 'bundler'
Bundler.require

Dotenv.load

map '/assets' do
  sprockets = Sprockets::Environment.new
  sprockets.append_path 'assets/css'
  sprockets.append_path 'assets/img'
  run sprockets
end

require './marvel'
require './app'
run App