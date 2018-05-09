class CompanyOwner::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = CompanyOwner.order(updated_at: :desc)
  end
end
