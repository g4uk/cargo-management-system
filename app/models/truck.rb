class Truck < ApplicationRecord
  has_many :trailers, dependent: :nullify
  belongs_to :company
  belongs_to :driver, optional: true
end
