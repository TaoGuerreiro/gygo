class CreateAuthorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :authorizations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :access_token
      t.string :access_token_secret
      t.string :email
      t.boolean :expires
      t.date :expires_at
      t.string :provider
      t.string :refresh_token
      t.string :uid

      t.timestamps
    end
  end
end
