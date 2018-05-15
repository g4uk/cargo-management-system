class InsurancePolicy::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(InsurancePolicy, :find)
    step Policy::Pundit(InsurancePolicyPolicy, :update)
    step Contract::Build(constant: InsurancePolicy::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :insurance_policy)
  step Contract::Persist()
end
