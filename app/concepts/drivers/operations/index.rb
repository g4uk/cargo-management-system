# frozen_string_literal: true

class Driver::Index < ApplicationOperation
  step Policy::Pundit(DriverPolicy, :index)
  step :model!

  def model!(options, current_user:, **)
    options[:model] = if current_user.is_a?(CompanyOwner)
                        Driver.where(company_id: current_user.companies.ids).order(first_name: :asc)
                      else
                        Driver.includes(:company).order(first_name: :asc)
                      end
  end
end
