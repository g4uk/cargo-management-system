class Order::AssignDriver < ApplicationOperation
  class Present < ApplicationOperation
    step :model!

    def model!(options, params:, **)
      options[:model] = Order.find(params[:order_id])
    end
  end

  step Nested(Present)

  step :assign_driver_to_order

  def assign_driver_to_order(_options, model:, params:, **)
    model.update(driver_id: params[:driver_id], status: 'In progress')
  end
end
