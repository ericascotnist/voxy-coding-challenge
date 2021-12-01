Before do
    @login_page = LoginPage.new
    DEVICE.eql?('desktop') ? Capybara.page.driver.browser.manage.window.maximize : Capybara.current_session.driver.browser.manage.window.resize_to(400,584)
end

After do |scenario|
    if scenario.failed?
        screenshot = "results/screenshots_failed/#{scenario.name.gsub(' ','_').downcase}.png"
        page.save_screenshot(screenshot)
        attach(screenshot, 'image/png')
    else
        screenshot = "results/screenshots_passed/#{scenario.name.gsub(' ','_').downcase}.png"
        page.save_screenshot(screenshot)
        attach(screenshot, 'image/png')
    end
end