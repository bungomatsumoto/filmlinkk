class AddRightHolderRefToFilms < ActiveRecord::Migration[5.2]
  def change
    add_reference :films, :right_holder, foreign_key: true
  end
end
