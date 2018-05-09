class DriverLicense::Show < ApplicationOperation
  step Model(DriverLicense, :find)
end
