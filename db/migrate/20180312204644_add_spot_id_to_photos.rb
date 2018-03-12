class AddSpotIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :spot_id, :integer
  end
end
