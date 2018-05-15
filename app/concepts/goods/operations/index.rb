# frozen_string_literal: true

class Good::Index < ApplicationOperation
  step Policy::Pundit(GoodsPolicy, :index)
  step :model!

  def model!(options, current_user:, **)
    options[:model] = if current_user.is_a?(Customer)
                        Good.where(customer_id: current_user.id)
                      else
                        Good.includes(:customer).order(updated_at: :desc)
                      end
  end
end
