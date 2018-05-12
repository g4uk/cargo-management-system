class CreateDriverLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :driver_licenses do |t|
      t.string :categories, null: false
      t.string :valid_to, null: false
      t.string :additional_notes

      t.timestamps
    end
  end
end
