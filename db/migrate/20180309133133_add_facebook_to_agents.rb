class AddFacebookToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :facebook, :string
    add_column :agents, :youtube, :string
    add_column :agents, :quote, :string
    add_column :agents, :text, :string
    add_column :agents, :featured_image, :string
    add_column :agents, :agent_type, :string
  end
end
