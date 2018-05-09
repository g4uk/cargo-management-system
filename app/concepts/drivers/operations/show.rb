class Driver::Show < ApplicationOperation
  step Model(Driver, :find)
end
