module InsurancePolicy::Contract
  class Create < Reform::Form
    properties :valid_to, :insurance_policy_type, :cost, :driver_id

    validates :valid_to, :insurance_policy_type, presence: true
    validates :cost, numericality: { greater_than: 0 }
    validates :driver_id, presence: true
  end
end
