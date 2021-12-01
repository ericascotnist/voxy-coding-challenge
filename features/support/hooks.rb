Before do
    @login_page = LoginPage.new
    @code_activation_page = CodeActivation.new
    @login_page.load
    @code_activation_page.load
    DEVICE.eql?('desktop') ? Capybara.page.driver.browser.manage.window.maximize : Capybara.current_session.driver.browser.manage.window.resize_to(360,640)
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