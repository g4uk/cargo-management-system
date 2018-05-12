module Driver::Contract
  class Create < Reform::Form
    properties :first_name, :last_name, :email, :phone, :password, :medical_examination_validity,
               :birth_date, :status, :years_of_experience, :company_id
    property :password_confirmation, virtual: true

    validates :phone, :medical_examination_validity, :status, presence: true
    validates :company_id, inclusion: { in: ->(*) { Company.pluck(:id).map(&:to_s) } }
    validates :email, format: { with: Devise.email_regexp }
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true
  end
end
