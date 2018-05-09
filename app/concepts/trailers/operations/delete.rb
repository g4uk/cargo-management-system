class Trailer::Delete < ApplicationOperation
  step Model(Trailer, :find)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
