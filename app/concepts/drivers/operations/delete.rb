class Driver::Delete < ApplicationOperation
  step Model(Driver, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
