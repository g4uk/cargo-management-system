class Good < ApplicationRecord
  has_many :orders, through: :goods_orders
  belongs_to :customer
end
