class Driver::FinishOrder < ApplicationOperation
  step :change_order_status

  def change_order_status(_options, params:, **)
    Order.find(params[:order_id]).update(status: 'Completed')
  end
end
