class AddNameToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :filename, :string
  end
end
