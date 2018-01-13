class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.string :location
      t.string :map_url
      t.string :image_url
      t.string :city
      t.string :region
      t.string :address
      t.string :commment
      t.timestamps null: false
    end
  end
end
