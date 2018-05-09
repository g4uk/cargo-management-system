class InsurancePolicy::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = InsurancePolicy.order(updated_at: :desc)
  end
end
