class AddColumnsToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :featured, :boolean
  	add_column :posts, :subtitle, :string
  	add_column :posts, :second_text, :string
  	add_column :posts, :image_url, :string
  	add_column :posts, :release_date, :date
  	add_column :posts, :place, :string
  	add_column :posts, :flaitometro, :integer
  end
end
