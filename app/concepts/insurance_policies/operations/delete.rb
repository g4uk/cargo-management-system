class InsurancePolicy::Delete < ApplicationOperation
  step Model(InsurancePolicy, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
