class RenameBlogIdCulumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :blog_id, :picture_id
  end
end
