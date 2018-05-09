class Customer::Show < ApplicationOperation
  step Model(Customer, :find)
end
