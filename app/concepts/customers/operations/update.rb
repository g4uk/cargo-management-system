class Customer::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Policy::Pundit(CustomerPolicy, :admin?)
    step Model(Customer, :find)
    step Contract::Build(constant: Customer::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :customer)
  step Contract::Persist()
end
