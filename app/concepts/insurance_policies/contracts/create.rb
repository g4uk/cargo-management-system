module InsurancePolicy::Contract
  class Create < Reform::Form
    properties :valid_to, :insurance_policy_type, :cost, :driver_id

    validates :valid_to, presence: true
    validates :cost, :insurance_policy_type, numericality: { greater_than: 0 }
    validates :driver_id, presence:true, inclusion: { in: ->(*) { Driver.pluck(:id).map(&:to_s) } }
  end
end
