class AddTermsOfServiceToAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :terms_of_service, :string
    add_column :addresses, :address, :string
  end
end
