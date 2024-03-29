class Truck::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Policy::Pundit(TruckPolicy, :create)
    step Model(Truck, :new)
    step Contract::Build(constant: Truck::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :truck)
  step Contract::Persist()
end
