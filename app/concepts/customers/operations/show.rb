class Customer::Show < ApplicationOperation
  step Policy::Pundit(CustomerPolicy, :admin?)
  step Model(Customer, :find)
end
