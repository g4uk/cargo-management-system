class DriverLicense::Create < ApplicationOperation
  class Present < ApplicationOperation
    step Model(DriverLicense, :new)
    step Policy::Pundit(DriverLicensePolicy, :create)
    success :set_driver
    step Contract::Build(constant: DriverLicense::Contract::Create)

    def set_driver(_options, model:, current_user:, **)
      model.driver_id = current_user.id if current_user.is_a?(Driver)
    end
  end

  step Nested(Present)
  step Contract::Validate(key: :driver_license)
  step Contract::Persist()
end
