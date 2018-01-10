require "google/cloud/storage"
class Event < ActiveRecord::Base
	has_many :photos, :inverse_of => :event

	BASE_URL="https://storage.googleapis.com/sktv/Eventos/"

	def cover_url
		gen_gcloud_url self.code_name, self.image_url
	end

	def all_photos
		self.photos.map { |p| p.slice(:id, :photo_url) }
	end

	private

	def gen_gcloud_url code_name, image_url
		code_name && image_url ? "#{BASE_URL}#{code_name}/#{image_url}" : 'https://i.imgur.com/hXPwgqu.jpg'
	end


	# RAILS ADMIN
	rails_admin do
		weight 1
		label "Galeria"
		label_plural "Galerias"
		
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

		configure :photos do
			hide
		end

		configure :release_date do
			label "Fecha de la Galeria"
		end

		configure :code_name do
			label "Nombre carpeta"
		end

		configure :image_url do
			label "Foto Portada"
			help "Nombre archivo foto"
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
