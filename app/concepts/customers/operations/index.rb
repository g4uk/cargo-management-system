class Customer::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = Customer.order(updated_at: :desc)
  end
end
