class CompanyOwner::Show < ApplicationOperation
  step Model(CompanyOwner, :find)
end
