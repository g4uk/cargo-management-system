class Truck::Index < ApplicationOperation
  step Policy::Pundit(TruckPolicy, :index)
  step :model!

  def model!(options, current_user:, **)
    if current_user.is_a?(Driver)
      options[:model] = Truck.includes(:company, :driver).where(driver_id: current_user.id).order(brand: :asc)
    elsif current_user.is_a?(CompanyOwner)
      options[:model] = Truck.includes(:company, :driver).where(company_id: current_user.companies.ids).order(brand: :asc)
    else
      options[:model] = Truck.includes(:company, :driver).order(brand: :asc)
    end
  end
end
