class InsurancePolicy::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(InsurancePolicy, :new)
    step Contract::Build(constant: InsurancePolicy::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :insurance_policy)
  step Contract::Persist()
end
