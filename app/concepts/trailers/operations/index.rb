class Trailer::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = Trailer.order(updated_at: :desc)
  end
end
