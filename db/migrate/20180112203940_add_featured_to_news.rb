class AddFeaturedToNews < ActiveRecord::Migration
  def change
    add_column :news, :featured, :boolean
  end
end
