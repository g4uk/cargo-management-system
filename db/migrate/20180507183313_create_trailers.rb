class CreateTrailers < ActiveRecord::Migration[5.2]
  def change
    create_table :trailers do |t|
      t.string :reg_number, null: false
      t.string :color, null: false
      t.string :trailer_type, null: false
      t.string :weight, null: false
      t.string :height, null: false
      t.string :length, null: false
      t.string :volume, null: false
      t.date :year_of_issue, null: false

      t.timestamps
    end
  end
end
