class AddYoutubeIdToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :youtube_id, :string
  end
end
