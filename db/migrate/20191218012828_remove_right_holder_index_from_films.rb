class RemoveRightHolderIndexFromFilms < ActiveRecord::Migration[5.2]
  def change
    remove_index :films, column: :right_holder_id
  end
end
