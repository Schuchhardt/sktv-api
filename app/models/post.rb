class Post < ActiveRecord::Base
	has_many :photos, :inverse_of => :post, dependent: :delete_all

	def youtube_iframe_url
		self.youtube_url.present? ? "https://www.youtube.com/embed/#{self.youtube_url}?rel=0" : false
	end

	# RAILS ADMIN
	rails_admin do
		weight 1
		label "Publicación"
		label_plural "Publicaciones"
		
		configure :featured do
			label "Destacado?"
		end

		configure :title do
			label "Titulo"
			required true
		end

		configure :subtitle do
			label "Subtitulo (Tipo de Publicacion)"
			help "Entrevista / Inauguracion / Lugar / Nota / Etc..."
		end

		configure :intro do
			label "Intro - Bajada"
		end


		configure :text, :text do
			label "Texto"
		end

		configure :second_text, :text do 
			label "Texto Auxiliar"
		end

		configure :place do
			label "Lugar"
		end

		configure :release_date do
			label "Fecha"
		end

		configure :image_url do
			label "URL Foto"
			help "Poner link completo - imgur.com"
		end

		configure :flaitometro, :enum do 
			enum do
			    { '*': 1, '**': 2, '***': 3, '****': 4, '*****': 5 }
			end
		end
		
		list do
			field :title
			field :subtitle
			field :place
		end

		show do
			field :title
			field :subtitle
			field :place
			field :intro
			field :text
			field :second_text
			field :image_url do
				formatted_value do
					bindings[:view].tag(:img, { :src => bindings[:object].cover_url }) << value
				end
			end
		end
	end
end
