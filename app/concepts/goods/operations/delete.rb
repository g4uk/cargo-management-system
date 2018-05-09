class Good::Delete < ApplicationOperation
  step Model(Good, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
