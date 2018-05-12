module Trailer::Contract
  class Create < Reform::Form
    properties :reg_number, :color, :trailer_type,
               :weight, :volume, :height, :length,
               :year_of_issue, :truck_id, :company_id

    validates :reg_number, :color, :trailer_type, :volume, :height, :length, :year_of_issue, presence: true
    validates :truck_id, inclusion: { in: ->(*) { Truck.pluck(:id).map(&:to_s) } }, allow_blank: true
    validates :company_id, presence: true, inclusion: { in: ->(*) { Company.pluck(:id).map(&:to_s) } }
  end
end
