class Trucks::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Trucks, :new)
    step Contract::Build(constant: Trucks::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :Trucks)
  step Contract::Persist()
end
