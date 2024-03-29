class Order < ApplicationRecord
  has_many :goods_orders, dependent: :delete_all
  has_many :goods, through: :goods_orders
  belongs_to :customer
  belongs_to :driver, optional: true
end
