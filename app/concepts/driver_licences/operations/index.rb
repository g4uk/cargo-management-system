# frozen_string_literal: true

class DriverLicense::Index < ApplicationOperation
  step :model!

  def model!(options, current_user:, **)
    options[:model] = if current_user.class == Driver
                        DriverLicense.where(driver_id: current_user.id).order(updated_at: :desc)
                      else
                        DriverLicense.includes(:driver).order(updated_at: :desc)
                      end
  end
end
