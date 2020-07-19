class RenameImageCulumnToPictures < ActiveRecord::Migration[5.2]
  def change
    rename_column :pictures, :image, :picture
  end
end
