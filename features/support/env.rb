require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = App

class MyWorld
  include Capybara::DSL

  def app
    Sinatra::Application
  end
  
end

World{MyWorld.new}

