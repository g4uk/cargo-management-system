class Company::Index < ApplicationOperation
  step :model!

  def model!(options, current_user:, **)
    if current_user.class == Admin
      options[:model] = Company.order(updated_at: :desc)
    elsif current_user.class == CompanyOwner
      options[:model] = current_user.companies.order(updated_at: :desc)
    end
  end
end
