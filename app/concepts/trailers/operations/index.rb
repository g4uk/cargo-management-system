class Trailer::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = Trailer.includes(:company).order(updated_at: :desc)
  end
end
