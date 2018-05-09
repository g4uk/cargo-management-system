class Trailer::Show < ApplicationOperation
  step Model(Trailer, :find)
end
