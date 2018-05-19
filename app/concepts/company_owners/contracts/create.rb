module CompanyOwner::Contract
  class Create < Reform::Form
    properties :first_name, :last_name, :email, :phone, :password
    property :password_confirmation, virtual: true

    validates :phone, presence: true
    validates_uniqueness_of :email
    validates :email, format: { with: Devise.email_regexp }
    validates :password, presence: true, confirmation: true, allow_blank: true
    validates :password_confirmation, presence: true, allow_blank: true
  end
end
