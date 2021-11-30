require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host       = 'https://web-stage.voxy.com'
    config.default_max_wait_time = 15
end