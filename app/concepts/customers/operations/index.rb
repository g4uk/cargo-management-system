class Customer::Index < ApplicationOperation
  step Policy::Pundit(CustomerPolicy, :admin?)
  step :model!

  def model!(options, *)
    options[:model] = Customer.order(first_name: :asc)
  end
end
