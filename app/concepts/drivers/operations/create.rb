class Driver::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Driver, :new)
    step Contract::Build(constant: Driver::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :driver)
  step Contract::Persist()
end
