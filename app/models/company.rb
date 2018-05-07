class Company < ApplicationRecord
  has_many :drivers, dependent: :delete_all
  belongs_to :company_owner
end
