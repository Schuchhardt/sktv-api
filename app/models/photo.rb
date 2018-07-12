class Photo < ActiveRecord::Base
	belongs_to :event, :inverse_of => :photos
	belongs_to :post, :inverse_of => :photos
	belongs_to :agent, :inverse_of => :photos
	belongs_to :spot, :inverse_of => :photos
	
	# RAILS ADMIN
	rails_admin do
		weight 10
		label "Foto"
		label_plural "Fotos"

		configure :photo_url do
			label "URL imagen"
			help "nombreEvento/nombreArchivo.jpg o link de imgur.com"
		end

		configure :caption, :text do
			label "Descripcion"
		end

		configure :order do
			label "Orden"
		end

		configure :filename do
			hide
		end

		configure :event do
			hide
		end

		configure :post do
			hide
		end

		configure :agent do
			hide
		end

		configure :spot do
			hide
		end
	end
end
