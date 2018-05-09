class CompanyOwner::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(CompanyOwner, :find)
    step Contract::Build(constant: CompanyOwner::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :company_owner)
  step Contract::Persist()
end
