# frozen_string_literal: true

class CreateGoodsOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :goods_orders, &:timestamps
  end
end
