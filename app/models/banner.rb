class Banner < ActiveRecord::Base

	# RAILS ADMIN
	rails_admin do
		weight 10
		label "Banner"
		label_plural "Banners"

		configure :image_url do
			label "URL imagen"
		end

		configure :name do
			label "Nombre"
		end

		configure :link do
			label "Link"
		end

	end
end
