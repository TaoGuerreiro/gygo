class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.string :day
      t.string :start_hour
      t.string :end_hour
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
