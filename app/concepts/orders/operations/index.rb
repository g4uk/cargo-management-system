class Order::Index < ApplicationOperation
  step :model!

  def model!(options,current_user:, **)
    if current_user.class.is_a?(Driver) ||  current_user.class.is_a?(Customer)
      options[:model] = current_user.orders.order(updated_at: :desc)
    else
      options[:model] = Order.order(updated_at: :desc)
    end
  end
end
