class Order::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = Order.order(updated_at: :desc)
  end
end
