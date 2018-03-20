class AddFlaitometroToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :flaitometro, :integer
  end
end
