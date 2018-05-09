class CompanyOwner::Delete < ApplicationOperation
  step Model(CompanyOwner, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
