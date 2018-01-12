class Photo < ActiveRecord::Base
	belongs_to :event, :inverse_of => :photos
	
	# RAILS ADMIN
	rails_admin do
		weight 10
		label "Foto"
		label_plural "Fotos"
	end
end
