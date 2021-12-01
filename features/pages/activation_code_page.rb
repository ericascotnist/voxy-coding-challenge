class CodeActivation < SitePrism::Page

    set_url '/v2/#/login'

    element :button_have_code, '.code-button'
    element :input_activation_code, '#activation-code'
    element :button_submit_code, '.redeem-code-form__submit-button'
    element :input_email, '#email'
    element :input_name, '#firstName'
    element :button_submit_form, '.redeem-code-modal__form-buttons .voxy-button'
    element :error_message, '.account-form__error'
    elements :input_password, '#password_input_field'
    elements :password_error_msg, '.password-input__error'

    def code_submit_enabled?
        !button_submit_code[:class].include?('disabled')
    end

end