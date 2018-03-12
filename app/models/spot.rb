class Spot < ActiveRecord::Base
	has_many :photos, :inverse_of => :agent, dependent: :delete_all
	
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

		configure :commment do
			label "Comentario"
		end

		configure :address do
			label "Dirección"
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
