class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string  :name
      t.string  :description
      t.string  :detail_url
      t.string  :country
      t.string  :start
      t.string  :director
      t.string  :actors
      t.string  :screenplay
      t.string  :duration
      t.string  :age
      t.string  :rating
      t.string  :image_url
      t.belongs_to :category
      t.timestamps
    end
  end
end
