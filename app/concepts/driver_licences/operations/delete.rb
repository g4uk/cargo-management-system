class DriverLicense::Delete < ApplicationOperation
  step Model(DriverLicense, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
