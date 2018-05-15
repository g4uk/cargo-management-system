class Order::Show < ApplicationOperation
  step Model(Order, :find)
  step Policy::Pundit(OrderPolicy, :show)
end
