class RenameImageCulumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_image, :user_picture
  end
end
