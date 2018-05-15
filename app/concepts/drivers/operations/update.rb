class Driver::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(Driver, :find)
    step Policy::Pundit(DriverPolicy, :update)
    step Contract::Build(constant: Driver::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :driver)
  step Contract::Persist()
end
