When('I click the activation code option') do
    @code_activation_page.button_have_code.click
end
  
When('set {string} as an activation code') do |code|
    @code_activation_page.input_activation_code.set code
end

Then('the code submit button should be disabled') do
    expect(@code_activation_page.code_submit_enabled?).to be false
end

When('fill the code activation form with valid data') do
    @code_activation_page.button_submit_code.click
    @code_activation_page.input_email.set 'valid@email.com'
    @code_activation_page.input_name.set 'John Doe'
    @code_activation_page.input_password[0].set 'Qwe123$%'
    @code_activation_page.input_password[1].set 'Qwe123$%'
    @code_activation_page.button_submit_form.click
end

When('fill the code activation form with invalid email') do
    @code_activation_page.button_submit_code.click
    @code_activation_page.input_email.set 'invalid@email'
    @code_activation_page.input_name.set 'John Doe'
    @code_activation_page.input_password[0].set 'Qwe123$%'
    @code_activation_page.input_password[1].set 'Qwe123$%'
    @code_activation_page.button_submit_form.click
end

When('fill the code activation form with mismatching passwords') do
    @code_activation_page.button_submit_code.click
    @code_activation_page.input_email.set 'valid@email.com'
    @code_activation_page.input_name.set 'John Doe'
    @code_activation_page.input_password[0].set 'Qwe123$%'
    @code_activation_page.input_password[1].set 'Qwe123$'
    @code_activation_page.button_submit_form.click
end

When('fill the code activation form with a weak password') do
    @code_activation_page.button_submit_code.click
    @code_activation_page.input_email.set 'valid@email.com'
    @code_activation_page.input_name.set 'John Doe'
    @code_activation_page.input_password[0].set 'aaa'
    @code_activation_page.input_password[1].set 'aaa'
    @code_activation_page.button_submit_form.click
end

Then ('{string} error message(s) is shown') do |error_type|
    case error_type
    when 'nonexistent code'
        expect(@code_activation_page.error_message.text).to eql('The code you entered isn\'t working. Are you sure you copied it correctly? Please try again.')
    when 'invalid email'
        expect(@code_activation_page.error_message.text).to eql('Please enter a valid email')
    when 'mismatching paswords'
        expect(@code_activation_page.error_message.text).to eql('Passwords must match')
    when 'password strength'
        expect(@code_activation_page.password_error_msg[0].text).to eql('Password must contain at least 8 characters.')
        expect(@code_activation_page.password_error_msg[1].text).to eql('Password must contain at least one uppercase and one lowercase letter.')
        expect(@code_activation_page.password_error_msg[2].text).to eql('Password must contain at least one number.')
    else
        "Error: Invalid parameter"
    end
end