class Truck::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = Truck.order(updated_at: :desc)
  end
end
