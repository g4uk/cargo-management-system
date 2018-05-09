class InsurancePolicy::Show < ApplicationOperation
  step Model(InsurancePolicy, :find)
end
