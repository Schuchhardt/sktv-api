class Post < ActiveRecord::Base
	include PgSearch
	has_many :photos, :inverse_of => :post, dependent: :delete_all
	
	multisearchable against: %i(title subtitle intro text second_text place)

	def img
		self.image_url
	end

	def youtube_iframe_url
		self.youtube_url.present? ? "https://www.youtube.com/embed/#{self.youtube_url}?rel=0" : false
	end

	# RAILS ADMIN
	rails_admin do
		weight 1
		label "Publicación"
		label_plural "Publicaciones"

		configure :is_cover do
			label "Portada?"
		end
		
		configure :featured do
			label "Destacado?"
		end

		configure :recommended do
			label "Recomendado?"
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
			help '<a href="http://google.cl" target="_blank">LINK</a>
					<b>Negrita</b>
					<i>Cursiva</i>
					<img src="link_imagen.jpg">'
		end

		configure :second_text, :text do 
			label "Texto Auxiliar"
			help '<a href="http://google.cl" target="_blank">LINK</a>
					<b>Negrita</b>
					<i>Cursiva</i>
					<img src="link_imagen.jpg">'
		end

		configure :place do
			label "Lugar"
		end

		configure :release_date, :date do
			label "Fecha"
			strftime_format "%d-%m-%Y"
		end

		configure :image_url do
			label "URL Foto"
			help "Poner link completo - imgur.com"
		end

		configure :youtube_url do
			label "ID youtube"
			help "Poner SOLO el id - (ej: si es https://youtu.be/20vRkFCgjsY poner solo 20vRkFCgjsY)"
		end

		configure :flaitometro, :enum do 
			enum do
			    { '*': 1, '**': 2, '***': 3, '****': 4, '*****': 5 }
			end
		end
		
		list do
			field :title
			field :place
			field :featured
			field :is_cover
			field :recommended
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
					bindings[:view].tag(:img, { :src => bindings[:object].image_url }) << value
				end
			end
		end
	end
end
