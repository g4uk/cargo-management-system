# frozen_string_literal: true

class Order::Index < ApplicationOperation
  step :model!
  step Policy::Pundit(OrderPolicy, :index)

  def model!(options, current_user:, **)
    options[:model] = if current_user.is_a?(Driver)
                        Order.where(driver_id: nil).or(Order.where(driver_id: current_user.id)).order(updated_at: :desc)
                      elsif current_user.is_a?(CompanyOwner)
                        Order.includes(:customer, :goods).where(driver_id: nil).or(Order.includes(:customer, :goods).where(driver_id: Driver.where(company_id: current_user.companies.ids).ids)).order(updated_at: :desc)
                      elsif current_user.is_a?(Customer)
                        current_user.orders.includes(:driver).order(updated_at: :desc)
                      else
                        Order.includes(:driver, :customer).order(updated_at: :desc)
                      end
  end
end
