class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.string :age
      t.string :phone
      t.string :email
      t.string :webpage
      t.string :instagram
	  t.string :photo_url
      t.timestamps null: false
    end
  end
end
