class AddAditionalTextToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :aditional_text, :string
    add_column :spots, :flaitometro_text, :string
    add_column :spots, :youtube_url, :string
  end
end
