class Trucks::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Trucks, :find)
    step Contract::Build(constant: Trucks::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :Trucks)
  step Contract::Persist()
end
