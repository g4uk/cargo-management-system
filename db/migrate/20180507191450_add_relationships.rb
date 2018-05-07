# frozen_string_literal: true

class AddRelationships < ActiveRecord::Migration[5.2]
  def change
    change_table :companies do |t|
      t.belongs_to :company_owner, index: true
    end

    change_table :drivers do |t|
      t.belongs_to :company, index: true
    end

    change_table :driver_licenses do |t|
      t.belongs_to :driver, index: true
    end

    change_table :insurance_policies do |t|
      t.belongs_to :driver, index: true
    end

    change_table :orders do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :driver, index: true
    end

    change_table :trucks do |t|
      t.belongs_to :driver, index: true
      t.belongs_to :company, index: true
    end

    change_table :trailers do |t|
      t.belongs_to :truck, index: true
      t.belongs_to :company, index: true
    end

    change_table :goods do |t|
      t.belongs_to :customer, index: true
    end

    change_table :goods_orders do |t|
      t.belongs_to :good, index: true
      t.belongs_to :order, index: true
    end

    add_foreign_key :companies, :company_owners
    add_foreign_key :drivers, :companies
    add_foreign_key :driver_licenses, :drivers
    add_foreign_key :insurance_policies, :drivers
    add_foreign_key :orders, :customers
    add_foreign_key :orders, :drivers
    add_foreign_key :trucks, :drivers
    add_foreign_key :trucks, :companies
    add_foreign_key :trailers, :trucks
    add_foreign_key :trailers, :companies
    add_foreign_key :goods, :customers
    add_foreign_key :goods_orders, :orders
    add_foreign_key :goods_orders, :goods
  end
end
