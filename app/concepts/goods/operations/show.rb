class Good::Show < ApplicationOperation
  step Model(Good, :find)
  step Policy::Pundit(GoodsPolicy, :show)
end
