class Company::Delete < ApplicationOperation
  step Model(Company, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
