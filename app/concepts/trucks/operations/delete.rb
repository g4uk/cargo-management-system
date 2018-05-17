class Truck::Delete < ApplicationOperation
  step Model(Truck, :find)
  step Policy::Pundit(TruckPolicy, :delete)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
