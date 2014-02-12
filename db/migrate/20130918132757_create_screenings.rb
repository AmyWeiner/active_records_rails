class CreateScreenings < ActiveRecord::Migration
  def change
    create_table :screenings do |t|
      t.datetime :datetime
      t.boolean :omu
      t.boolean :ov
      t.references :screenable, polymorphic: true
      t.belongs_to :venue
      t.timestamps
    end
  end
end
