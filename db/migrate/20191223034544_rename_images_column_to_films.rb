class RenameImagesColumnToFilms < ActiveRecord::Migration[5.2]
  def change
    rename_column :films, :images, :image
  end
end
