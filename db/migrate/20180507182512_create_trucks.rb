class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.string :reg_number, null: false
      t.string :body_number
      t.string :weight
      t.string :color, null: false
      t.date :year_of_issue, null: false

      t.timestamps
    end
  end
end
