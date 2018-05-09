class Company::Show < ApplicationOperation
  step Model(Company, :find)
end
