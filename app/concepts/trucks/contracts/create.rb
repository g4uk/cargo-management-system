module Truck::Contract
  class Create < Reform::Form
    properties :reg_number, :body_number, :weight, :color, :year_of_issue, :driver_id, :company_id

    validates :reg_number, :color, :year_of_issue, presence: true
    validates :driver_id, inclusion: { in: ->(*) { Driver.pluck(:id).map(&:to_s) } }, allow_blank: true
    validates :company_id, inclusion: { in: ->(*) { Company.pluck(:id).map(&:to_s) } }
  end
end