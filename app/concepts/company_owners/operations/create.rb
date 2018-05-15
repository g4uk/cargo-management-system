class CompanyOwner::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Policy::Pundit(CompanyOwnerPolicy, :admin?)
    step Model(CompanyOwner, :new)
    step Contract::Build(constant: CompanyOwner::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :company_owner)
  step Contract::Persist()
end
