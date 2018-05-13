class Driver::TakeOrder < ApplicationOperation

  step :assign_order_to_driver

  def assign_order_to_driver(_options, params:, **)
    Order.find(params[:order_id]).update(driver_id: params[:driver_id], status: 'In progress')
  end
end
