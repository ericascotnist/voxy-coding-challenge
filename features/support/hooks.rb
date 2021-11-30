Before do
    @login_page = LoginPage.new
end

After do |scenario|
    screenshot = "reports/screenshot#{scenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'the_screenshot')
  end