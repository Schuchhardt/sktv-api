class AddPhotoCoverToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_cover, :boolean
  end
end
