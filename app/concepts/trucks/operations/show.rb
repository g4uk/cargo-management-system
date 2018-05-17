class Truck::Show < ApplicationOperation
  step Model(Truck, :find)
  step Policy::Pundit(TruckPolicy, :show)
end
