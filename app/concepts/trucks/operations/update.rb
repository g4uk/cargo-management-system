class Truck::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Truck, :find)
    step Contract::Build(constant: Truck::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :truck)
  step Contract::Persist()
end
