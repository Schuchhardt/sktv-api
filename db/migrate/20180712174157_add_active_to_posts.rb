class AddActiveToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :recommended, :boolean
  end
end
