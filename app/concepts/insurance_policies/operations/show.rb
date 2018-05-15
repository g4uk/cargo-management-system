class InsurancePolicy::Show < ApplicationOperation
  step Model(InsurancePolicy, :find)
  step Policy::Pundit(InsurancePolicyPolicy, :show)
end
