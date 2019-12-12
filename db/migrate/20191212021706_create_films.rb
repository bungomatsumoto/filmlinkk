class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title, default: "", null: false
      t.text :film_intro
      t.string :director
      t.json :images
      t.text :document
      t.integer :production_year
      t.string :production_country
      t.integer :running_time
      t.text :cast
      t.string :genre

      t.timestamps
    end
  end
end
