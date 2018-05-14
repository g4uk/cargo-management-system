class Company::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Company, :find)
    step Policy::Pundit(CompanyPolicy, :update)
    step Contract::Build(constant: Company::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :company)
  step Contract::Persist()
end
