class AddTextToEvents < ActiveRecord::Migration
  def change
    add_column :events, :text, :string
    add_column :events, :featured_image, :string
  end
end
