class InsurancePolicy::Index < ApplicationOperation
  step :model!

  def model!(options, current_user: , **)
    options[:model] = if current_user.class == Driver
                        InsurancePolicy.where(driver_id: current_user.id).order(updated_at: :desc)
                      else
                        InsurancePolicy.includes(:driver).order(updated_at: :desc)
                      end
  end
end
