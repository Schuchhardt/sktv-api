class Agent < ActiveRecord::Base
	include PgSearch
	has_many :photos, :inverse_of => :agent, dependent: :delete_all

	multisearchable against: %i(name agent_type text quote)

	def title
		self.name
	end

	def img
		self.photo_url
	end

	# RAILS ADMIN
	rails_admin do
		weight 4
		label "Agente"
		label_plural "Agentes"


		configure :name do
			label "Nombre"
		end

		configure :age do
			label "Edad"
		end

		configure :phone do
			label "Fono"
		end

		configure :photo_url do
			required true
			label "Link de Imagen de Perfil"
		end

		configure :quote do
			label "Frase"
		end

		configure :text, :text do
			label "Texto"
		end

		configure :aditional_text, :text do
			label "Texto adicional"
		end

		configure :featured_image do
			label "Imagen Destacada"
		end

		configure :agent_type, :enum do 
			required true
			label "Tipo de Agente"
			enum do
			    { 'Fotógrafo': 'fotografo', 'Filmer': 'filmer', 'Kinesiologo': 'kinesiologo'}
			end
		end

	end
end
