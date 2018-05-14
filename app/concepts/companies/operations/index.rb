# frozen_string_literal: true

class Company::Index < ApplicationOperation
  step Policy::Pundit(CompanyPolicy, :index)
  step :model!

  def model!(options, current_user:, **)
    options[:model] = if current_user.class == Admin
                        Company.order(updated_at: :desc)
                      elsif current_user.class == CompanyOwner
                        current_user.companies.order(updated_at: :desc)
    end
  end
end
