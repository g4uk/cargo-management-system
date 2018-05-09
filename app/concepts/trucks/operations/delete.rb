class Trucks::Delete < ApplicationOperation
  step Model(Trucks, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
