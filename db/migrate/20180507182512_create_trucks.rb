class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.string :brand, null: false
      t.string :truck_model, null: false
      t.string :reg_number, null: false
      t.string :body_number
      t.string :weight
      t.string :color, null: false
      t.string :year_of_issue, null: false

      t.timestamps
    end
  end
end
