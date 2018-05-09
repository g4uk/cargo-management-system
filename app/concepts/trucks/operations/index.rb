class Trucks::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = Trucks.order(updated_at: :desc)
  end
end
