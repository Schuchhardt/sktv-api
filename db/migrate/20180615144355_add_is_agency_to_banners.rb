class AddIsAgencyToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :is_agency, :boolean
  end
end
