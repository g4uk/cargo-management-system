class Truck < ApplicationRecord
  has_many :trailers
  belongs_to :company
  belongs_to :driver, optional: true
end
