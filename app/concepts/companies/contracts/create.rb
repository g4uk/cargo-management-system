module Company::Contract
  class Create < Reform::Form
    properties :name, :address, :email, :phone, :company_owner_id

    validates :name, :address, :phone, presence: true
    validates :email, format: { with: Devise.email_regexp }, allow_blank: true
    validates :contact_id, presence: true, inclusion: { in: ->(*) { CompanyOwner.pluck(:id).map(&:to_s) } }
  end
end
