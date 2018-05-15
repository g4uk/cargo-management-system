class InsurancePolicy::Delete < ApplicationOperation
  step Model(InsurancePolicy, :find)
  step Policy::Pundit(InsurancePolicyPolicy, :delete)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
