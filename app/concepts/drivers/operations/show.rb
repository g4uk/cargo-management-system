class Driver::Show < ApplicationOperation
  step Model(Driver, :find)
  step Policy::Pundit(DriverPolicy, :show)
end
