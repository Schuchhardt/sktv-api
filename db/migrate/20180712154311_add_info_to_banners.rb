class AddInfoToBanners < ActiveRecord::Migration
  def change
  	add_column :banners, :show_home, :boolean
  	add_column :banners, :show_novedades, :boolean
  	add_column :banners, :show_galeria, :boolean
  	add_column :banners, :show_agents, :boolean
  	add_column :banners, :show_map, :boolean
  	add_column :banners, :secondary, :boolean, default: false
  end
end
