class RemoveRightHolderIdFromFilms < ActiveRecord::Migration[5.2]
  def up
    remove_column :films, :right_holder_id
  end

  def down
    add_column :films, :right_holder_id, :bigint
  end
end
