class Spot < ActiveRecord::Base
	include PgSearch
	has_many :photos, :inverse_of => :agent, dependent: :delete_all
	multisearchable against: %i(name location city region)

	def title
		self.name
	end

	def img
		self.image_url
	end

	def youtube_iframe_url
		self.youtube_url.present? ? "https://www.youtube.com/embed/#{self.youtube_url}?rel=0" : false
	end

	# RAILS ADMIN
	rails_admin do
		weight 5
		label "Skatepark"
		label_plural "Skateparks"

		configure :name do
			label "Nombre"
		end

		configure :location do
			label "Ubicación"
		end

		configure :map_url do
			label "Link Google Maps"
		end

		configure :image_url do
			label "Link Imagen"
		end

		configure :city do
			label "Ciudad"
		end

		configure :caption do
			label "label foto"
		end

		configure :flaitometro_text do
			label "Texto de flaitometro"
		end

		configure :youtube_url do
			label "ID youtube"
			help "Poner SOLO el id - (ej: si es https://youtu.be/20vRkFCgjsY poner solo 20vRkFCgjsY)"
		end

		configure :aditional_text, :text do
			label "Texto adicional"
			help '<a href="http://google.cl" target="_blank">LINK</a>
					<b>Negrita</b>
					<i>Cursiva</i>'
		end

		configure :commment, :text do
			label "Comentario"
			help '<a href="http://google.cl" target="_blank">LINK</a>
					<b>Negrita</b>
					<i>Cursiva</i>'
		end

		configure :address do
			label "Dirección"
		end

		configure :flaitometro, :enum do 
			enum do
			    { '*': 1, '**': 2, '***': 3, '****': 4, '*****': 5 }
			end
		end

		configure :region, :enum do 
			required true
			label "Region"
			enum do
				{
					"Aysén": "AI", 
					"Magallanes y Antártica Chilena": "MA", 
					"Tarapacá": "TA", 
					"Antofagasta": "AN", 
					"Atacama": "AT", 
					"Coquimbo": "CO", 
					"Región Metropolitana de Santiago": "RM", 
					"Valparaíso": "VS", 
					"Araucanía": "AR", 
					"Bío-Bío": "BI", 
					"Libertador General Bernardo O'Higgins": "LI", 
					"Los Lagos": "LL", 
					"Maule": "ML", 
					"Arica y Parinacota": "AP", 
					"Los Ríos": "LR"
				}
			end
		end

	end
end
