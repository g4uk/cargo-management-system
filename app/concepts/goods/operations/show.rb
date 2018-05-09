class Good::Show < ApplicationOperation
  step Model(Good, :find)
end
