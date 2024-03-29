module DriverLicense::Contract
  class Create < Reform::Form
    properties :valid_to, :categories, :driver_id, :additional_notes

    validates :valid_to, :categories, presence: true
    validates :driver_id, presence: true
  end
end
