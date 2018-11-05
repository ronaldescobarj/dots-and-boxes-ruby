require 'bundler/setup'
require 'rack/file'
require 'capybara/rspec'

Capybara.app = Rack::File.new File.dirname __FILE__

describe "game page", :type => :request do
  it "contains an H1 with text 'Hello World!'" do
    visit '/game.erb'
    puts page.find("#l100_100_200_100").native.style
  end
end