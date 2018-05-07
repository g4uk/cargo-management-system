class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :name, null: false
      t.string :weight, null: false
      t.string :volume, null: false
      t.string :goods_type, null: false

      t.timestamps
    end
  end
end
