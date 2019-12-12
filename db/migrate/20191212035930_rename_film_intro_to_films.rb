class RenameFilmIntroToFilms < ActiveRecord::Migration[5.2]
  def change
    rename_column :films, :film_intro, :intro
  end
end
