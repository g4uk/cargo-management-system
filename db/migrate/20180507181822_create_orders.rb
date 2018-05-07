class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :cost
      t.string :downloading_address, null: false
      t.string :unloading_address, null: false
      t.string :status, default: 'Issued', null: false

      t.timestamps
    end
  end
end
