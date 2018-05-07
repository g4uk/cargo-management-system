class Company::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = Company.order(updated_at: :desc)
  end
end
