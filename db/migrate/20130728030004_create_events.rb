class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :datetime
      t.string :location_url
      t.string :artist
      t.belongs_to :venue
      t.belongs_to :city
      t.belongs_to :category
      t.timestamps
    end
  end
end
