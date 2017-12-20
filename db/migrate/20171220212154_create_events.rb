class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :place
      t.string :map_url
      t.string :code_name
      t.timestamps null: false
    end
  end
end
