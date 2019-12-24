class RemoveDocumentFromFilms < ActiveRecord::Migration[5.2]
  def up
    remove_column :films, :document
  end

  def down
    add_column :films, :document, :text
  end
end
