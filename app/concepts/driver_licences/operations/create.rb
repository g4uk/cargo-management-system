class DriverLicense::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(DriverLicense, :new)
    step Contract::Build(constant: DriverLicense::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :driver_license)
  step Contract::Persist()
end
