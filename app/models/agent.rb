class Agent < ActiveRecord::Base

	# RAILS ADMIN
	rails_admin do
		weight 4
		label "Agente"
		label_plural "Agentes"
	end
end
