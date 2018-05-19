class Good < ApplicationRecord
  has_many :goods_orders, dependent: :delete_all
  has_many :orders, through: :goods_orders, dependent: :destroy
  belongs_to :customer, dependent: :destroy

  def info
    "#{name}(#{goods_type})"
  end
end
