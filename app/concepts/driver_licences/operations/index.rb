class DriverLicense::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = DriverLicense.order(updated_at: :desc)
  end
end
