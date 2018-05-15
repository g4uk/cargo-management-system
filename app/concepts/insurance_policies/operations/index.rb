class InsurancePolicy::Index < ApplicationOperation
  step Policy::Pundit(InsurancePolicyPolicy, :index)
  step :model!

  def model!(options, current_user: , **)
    options[:model] = if current_user.is_a?(Driver)
                        InsurancePolicy.where(driver_id: current_user.id).order(updated_at: :desc)
                      elsif current_user.is_a?(CompanyOwner)
                        InsurancePolicy.includes(:driver).where(driver_id: Driver.where(company_id: current_user.companies.ids).ids)
                      else
                        InsurancePolicy.includes(:driver).order(updated_at: :desc)
                      end
  end
end
