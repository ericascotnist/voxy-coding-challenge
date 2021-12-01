require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'cucumber'
require 'pry'

DEVICE = ENV['DEVICE']

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host       = 'https://web-stage.voxy.com'
    config.default_max_wait_time = 15
end