class Customer::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Customer, :new)
    step Contract::Build(constant: Customer::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :customer)
  step Contract::Persist()
end
