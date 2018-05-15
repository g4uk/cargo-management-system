class CompanyOwner::Show < ApplicationOperation
  step Policy::Pundit(CompanyOwnerPolicy, :admin?)
  step Model(CompanyOwner, :find)
end
