class Trailer::Show < ApplicationOperation
  step Model(Trailer, :find)
  step Policy::Pundit(TrailerPolicy, :show)
end
