class Good::Delete < ApplicationOperation
  step Model(Good, :find)
  step Policy::Pundit(GoodsPolicy, :delete)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
