class Company::Show < ApplicationOperation
  step Model(Company, :find)
  step Policy::Pundit(CompanyPolicy, :show)
end
