class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :image_url
      t.string :name
      t.string :link
    end
  end
end
