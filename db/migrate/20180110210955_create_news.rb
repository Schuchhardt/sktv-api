class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :subtitle
      t.string :description
      t.string :text1
      t.string :text2
      t.string :image_url
      t.timestamps null: false
    end
  end
end
