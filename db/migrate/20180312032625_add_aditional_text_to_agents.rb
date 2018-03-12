class AddAditionalTextToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :aditional_text, :string
  end
end
