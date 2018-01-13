class Spot < ActiveRecord::Base
	# RAILS ADMIN
	rails_admin do
		weight 5
		label "Spot"
		label_plural "Spots"
	end
end
