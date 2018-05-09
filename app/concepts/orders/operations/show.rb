class Order::Show < ApplicationOperation
  step Model(Order, :find)
end
