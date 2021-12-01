
Given ("I'm on voxy's login page") do
    @login_page.load
end

Given("I type the email {string}") do |email|
    @login_page.input_email.set(email)
end
  
Then('the submit button should be disabled') do
    expect(@login_page.submit_enabled?).to be false
end  

When ('select mobile number login option') do
    @login_page.mobile_phone_radio.click
end

When ('select {string} as country') do |country|
    @login_page.button_dropdown.click
    @login_page.countries_list.detect{ |opt| opt.text.include?(country) }.select_option
end

When('type the number {string}') do |phone_number|
    @login_page.input_phone.set phone_number
end

When('click on submit button') do
    @login_page.submit_button.click
  end
  
Then('an error message must be shown') do
    expect(@login_page.login_error_message.text).to include('Não foi possível encontrar sua conta desta maneira.')
end
  
  