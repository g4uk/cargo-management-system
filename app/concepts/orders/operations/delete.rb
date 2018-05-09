class Order::Delete < ApplicationOperation
  step Model(Order, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
