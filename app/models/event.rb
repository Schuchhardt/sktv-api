class Event < ActiveRecord::Base

	BASE_URL="https://storage.googleapis.com/sktv/Eventos/"

	def cover_url
		self.image_url ? "#{BASE_URL}#{self.code_name}/#{self.image_url}" : 'https://i.imgur.com/hXPwgqu.jpg'
	end


	# RAILS ADMIN
	rails_admin do
		weight 1
		label "Evento"
		label_plural "Eventos"
		
		configure :name do
			label "Nombre"
			required true
		end

		configure :description do
			label "Descripcion"
		end

		configure :place do
			label "Lugar"
		end

		configure :map_url do
			label "Link Mapa"
		end

		configure :code_name do
			label "Nombre carpeta"
		end

		configure :image_url do
			label "Foto Portada"
		end
		
		list do
			field :name
			field :description
			field :place
		end

		show do
			field :name
			field :description
			field :place
			field :image_url do
				formatted_value do
					bindings[:view].tag(:img, { :src => bindings[:object].cover_url }) << value
				end
			end
		end
	end
end
