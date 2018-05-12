class CreateInsurancePolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :insurance_policies do |t|
      t.string :valid_to, null: false
      t.string :insurance_policy_type, null: false
      t.decimal :cost, null: false

      t.timestamps
    end
  end
end
