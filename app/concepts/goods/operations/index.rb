class Good::Index < ApplicationOperation
  step :model!

  def model!(options, *)
    options[:model] = Good.order(updated_at: :desc)
  end
end
