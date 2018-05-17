class Truck::Index < ApplicationOperation
  step Policy::Pundit(TruckPolicy, :index)
  step :model!

  def model!(options, current_user:, **)
    if current_user.is_a?(Driver)
      options[:model] = Truck.includes(:company).where(driver_id: current_user.id)
    elsif current_user.is_a?(CompanyOwner)
      options[:model] = Truck.includes(:company).where(company_id: current_user.companies.ids).order(updated_at: :desc)
    else
      options[:model] = Truck.includes(:company).order(updated_at: :desc)
    end
  end
end
