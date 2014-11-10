class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :name
      t.datetime :date_issued
      t.integer :user_id

      t.timestamps
    end
  end
end
