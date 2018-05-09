class Order::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Order, :find)
    step Contract::Build(constant: Order::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :order)
  step Contract::Persist()
end
