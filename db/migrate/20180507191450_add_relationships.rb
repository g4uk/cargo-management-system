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
      t.belongs_to :driver, index: true, unique: true
    end

    change_table :insurance_policies do |t|
      t.belongs_to :driver, index: true, unique: true
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
      t.references :good, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
    end
  end
end
