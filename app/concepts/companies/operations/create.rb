class Company::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Company, :new)
    step Contract::Build(constant: Company::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :company)
  step Contract::Persist()
end
