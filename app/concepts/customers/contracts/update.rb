module Customer::Contract
  class Update < Reform::Form
    properties :first_name, :last_name, :email, :mobile_phone, :company_phone, :password
    property :password_confirmation, virtual: true

    validates :company_phone, :mobile_phone, presence: true
    validates_uniqueness_of :email
    validates :email, format: { with: Devise.email_regexp }
    validates :password, presence: true, confirmation: true, allow_blank: true
    validates :password_confirmation, presence: true, allow_blank: true
  end
end
