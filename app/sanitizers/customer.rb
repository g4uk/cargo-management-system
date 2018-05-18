# frozen_string_literal: true

class Customer::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: %i[first_name
                              last_name
                              company_phone
                              mobile_phone
                              password
                              password_confirmation email])
  end
end
