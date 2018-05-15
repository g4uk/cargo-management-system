class Order::Delete < ApplicationOperation
  step Model(Order, :find)
  step Policy::Pundit(OrderPolicy, :delete)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
