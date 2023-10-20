class RenameUserAvaterUrlToAvatarURl < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :avater_url, :avatar_url
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
