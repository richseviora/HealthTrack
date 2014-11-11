class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.integer :user_id
      t.string :name
      t.datetime :date_started
      t.datetime :date_ended
      t.text :comments

      t.timestamps
    end
  end
end
