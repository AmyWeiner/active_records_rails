class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :description
      t.string :kind
      t.string :street1
      t.string :street2
      t.string :city
      t.string :district
      t.string :zip
      t.string :country
      t.string :email
      t.string :phone
      t.string :web
      t.string :transport
      t.string :lat
      t.string :lon
      t.timestamps
    end
  end
end
