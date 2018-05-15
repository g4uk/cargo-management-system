class DriverLicense::Show < ApplicationOperation
  step Model(DriverLicense, :find)
  step Policy::Pundit(DriverLicensePolicy, :show)
end
