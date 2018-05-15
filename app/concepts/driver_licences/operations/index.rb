# frozen_string_literal: true

class DriverLicense::Index < ApplicationOperation
  step Policy::Pundit(DriverLicensePolicy, :index)
  step :model!

  def model!(options, current_user:, **)
    options[:model] = if current_user.is_a?(Driver)
                        DriverLicense.where(driver_id: current_user.id).order(updated_at: :desc)
                      elsif current_user.is_a?(CompanyOwner)
                        DriverLicense.includes(:driver).where(driver_id: Driver.where(company_id: current_user.companies.ids).ids)
                      else
                        DriverLicense.includes(:driver).order(updated_at: :desc)
                      end
  end
end
