class DriverLicense::Delete < ApplicationOperation
  step Model(DriverLicense, :find)
  step Policy::Pundit(DriverLicensePolicy, :delete)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
