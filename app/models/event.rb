require "google/cloud/storage"

class Event < ActiveRecord::Base
	has_many :photos, :inverse_of => :event
	after_create :load_photos

	BASE_URL = "https://storage.googleapis.com/sktv/"

	def cover_url
		gen_gcloud_url self.code_name, self.image_url
	end

	def all_photos
		self.photos.map { |p| p.slice(:id, :photo_url) }
	end

	private

	def load_photos
	
		storage = Google::Cloud::Storage.new(
			project_id: ENV["GCLOUD_PROJECT_ID"],
			credentials: JSON.parse(ENV["GCLOUD_APPLICATION_CREDENTIALS"])
		)
		bucket = storage.bucket ENV["GCLOUD_BUCKET"]

		if self.code_name
			self.photos.delete_all
			
			event_files = bucket.files prefix: "Eventos/#{self.code_name}"
		
			event_files.all.each do |file|
				file.acl.public!
				Photo.create(photo_url: "#{BASE_URL}#{file.name}", event_id: self.id)
			end
		end
	end

	def gen_gcloud_url code_name, image_url
		code_name && image_url ? "#{BASE_URL}Eventos/#{code_name}/#{image_url}" : 'https://i.imgur.com/hXPwgqu.jpg'
	end


	# RAILS ADMIN
	rails_admin do
		weight 2
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
