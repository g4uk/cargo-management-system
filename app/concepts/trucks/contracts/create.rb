module Truck::Contract
  class Create < Reform::Form
    properties :brand, :truck_model, :reg_number, :body_number, :weight, :color, :year_of_issue, :driver_id, :company_id

    validates :reg_number, :body_number, :color, :brand, :truck_model, :year_of_issue, presence: true
    validates :company_id, presence: true
  end
end
