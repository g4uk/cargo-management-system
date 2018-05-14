class Company::Delete < ApplicationOperation
  step Model(Company, :find)
  step Policy::Pundit(CompanyPolicy, :delete)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
