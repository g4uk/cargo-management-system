class Trucks::Show < ApplicationOperation
  step Model(Trucks, :find)
end
