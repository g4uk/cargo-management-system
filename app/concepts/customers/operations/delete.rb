class Customer::Delete < ApplicationOperation
  step Model(Customer, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
