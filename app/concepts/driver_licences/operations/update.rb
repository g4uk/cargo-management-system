class DriverLicense::Update < ApplicationOperation
  class Present < ApplicationOperation
    step Model(DriverLicense, :find)
    step Policy::Pundit(DriverLicensePolicy, :update)
    step Contract::Build(constant: DriverLicense::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :driver_license)
  step Contract::Persist()
end
