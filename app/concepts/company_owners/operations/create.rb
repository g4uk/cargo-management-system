class CompanyOwner::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(CompanyOwner, :new)
    step Contract::Build(constant: CompanyOwner::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :company_owner)
  step Contract::Persist()
end
