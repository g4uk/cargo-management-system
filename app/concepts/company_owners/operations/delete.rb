class CompanyOwner::Delete < ApplicationOperation
  step Policy::Pundit(CompanyOwnerPolicy, :admin?)
  step Model(CompanyOwner, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
