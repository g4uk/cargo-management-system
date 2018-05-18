# frozen_string_literal: true

class Company::Index < ApplicationOperation
  step Policy::Pundit(CompanyPolicy, :index)
  step :model!

  def model!(options, current_user:, **)
    options[:model] = if current_user.class == Admin
                        Company.includes(:company_owner).order(name: :asc)
                      elsif current_user.class == CompanyOwner
                        current_user.companies.order(name: :asc)
    end
  end
end
