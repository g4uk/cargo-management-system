class Truck::Show < ApplicationOperation
  step Model(Truck, :find)
end
