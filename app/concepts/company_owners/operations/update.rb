class CompanyOwner::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(CompanyOwner, :find)
    step Policy::Pundit(CompanyOwnerPolicy, :admin?)
    step Contract::Build(constant: CompanyOwner::Contract::Update)
  end

  step Nested(Present)
  success :check_params_for_password
  step Contract::Validate(key: :company_owner)
  step Contract::Persist()

  def check_params_for_password(_options, params:, **)
    if params[:company_owner][:password].blank?
      params[:company_owner].delete(:password)
      params[:company_owner].delete(:password_confirmation)
    end
  end
end
