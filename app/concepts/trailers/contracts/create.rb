module Trailer::Contract
  class Create < Reform::Form
    properties :reg_number, :color, :trailer_type,
               :weight, :volume, :height, :length,
               :year_of_issue, :truck_id, :company_id

    validates :reg_number, :color, :trailer_type, :volume, :height, :length, :year_of_issue, presence: true
    validates :company_id, presence: true
  end
end
