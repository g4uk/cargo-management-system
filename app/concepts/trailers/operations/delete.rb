class Trailer::Delete < ApplicationOperation
  step Model(Trailer, :find)
  step Policy::Pundit(TrailerPolicy, :delete)
  step :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
