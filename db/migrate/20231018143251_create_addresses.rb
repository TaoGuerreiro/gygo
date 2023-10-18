class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :city
      t.string :country
      t.string :line_1
      t.string :line_2
      t.string :postal_code
      t.string :state
      t.string :phone
      t.string :comment

      t.timestamps
    end
  end
end
