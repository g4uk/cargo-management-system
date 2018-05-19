class Driver::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Driver, :find)
    step Policy::Pundit(DriverPolicy, :update)
    step Contract::Build(constant: Driver::Contract::Update)
  end

  step Nested(Present)
  success :check_params_for_password
  step Contract::Validate(key: :driver)
  step Contract::Persist()

  def check_params_for_password(_options, params:, **)
    if params[:driver][:password].blank?
      params[:driver].delete(:password)
      params[:driver].delete(:password_confirmation)
    end
  end
end
