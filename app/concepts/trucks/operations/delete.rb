class Truck::Delete < ApplicationOperation
  step Model(Truck, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
