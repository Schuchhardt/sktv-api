class AddCaptionToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :caption, :string
  end
end
