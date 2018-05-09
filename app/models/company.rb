class Company < ApplicationRecord
  has_many :drivers, dependent: :delete_all
  has_many :trucks, dependent: :delete_all
  has_many :trailers, dependent: :delete_all
  belongs_to :company_owner
end
