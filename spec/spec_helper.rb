require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::Console,
]
SimpleCov.start

