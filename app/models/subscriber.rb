class Subscriber < ActiveRecord::Base
	# RAILS ADMIN
	rails_admin do
		weight 10
		label "Suscriptor"
		label_plural "Suscriptores"


		configure :email do
			label "Correo"
		end
	end
end
