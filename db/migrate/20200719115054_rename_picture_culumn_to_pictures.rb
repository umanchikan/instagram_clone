class RenamePictureCulumnToPictures < ActiveRecord::Migration[5.2]
  def change
    rename_column :pictures, :picture, :blog_picture
  end
end
