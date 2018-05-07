class Truck < ApplicationRecord
  has_many :trailers
  belongs_to :driver
end
