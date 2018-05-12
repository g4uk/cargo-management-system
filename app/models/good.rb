class Good < ApplicationRecord
  has_many :goods_orders
  has_many :orders, through: :goods_orders
  belongs_to :customer

  def info
    "#{name}(#{goods_type})"
  end
end
