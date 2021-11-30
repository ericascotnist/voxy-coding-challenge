class LoginPage < SitePrism::Page

    set_url '/v2/#/login'

    element :input_email, '#login_form_email_input_field'
    element :submit_button, '#login_form_submit_button'
    element :mobile_phone_radio, '#login_form_field_phone i'
    element :button_dropdown, '.iti__selected-flag'
    element :input_phone, '.phone-input__control'
    element :modal_error_message, '.login-error-message'
    element :login_error_message, '.login-error-message__message'
    elements :countries_list, '.iti__country-name'

    def submit_enabled?
        !submit_button[:class].include?('disabled')
    end
end