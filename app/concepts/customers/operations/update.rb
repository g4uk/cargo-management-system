class Customer::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Policy::Pundit(CustomerPolicy, :admin?)
    step Model(Customer, :find)
    step Contract::Build(constant: Customer::Contract::Update)
  end

  step Nested(Present)
  success :check_params_for_password
  step Contract::Validate(key: :customer)
  step Contract::Persist()

  def check_params_for_password(_options, params:, **)
    if params[:customer][:password].blank?
      params[:customer].delete(:password)
      params[:customer].delete(:password_confirmation)
    end
  end
end
