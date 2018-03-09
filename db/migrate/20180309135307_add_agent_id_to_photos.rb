class AddAgentIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :agent_id, :integer
  end
end
