class Driver::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = Driver.order(updated_at: :desc)
  end
end
