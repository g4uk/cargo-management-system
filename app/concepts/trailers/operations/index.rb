class Trailer::Index < ApplicationOperation
  step Policy::Pundit(TrailerPolicy, :index)
  step :model!

  def model!(options, current_user:, **)
    if current_user.is_a?(Driver)
      options[:model] = Trailer.includes(:company, :truck).where(truck_id: current_user.truck&.id).order(updated_at: :desc)
    elsif current_user.is_a?(CompanyOwner)
      options[:model] = Trailer.includes(:company, :truck).where(company_id: current_user.companies.ids).order(updated_at: :desc)
    else
      options[:model] = Trailer.includes(:company, :truck).order(updated_at: :desc)
    end
  end
end
