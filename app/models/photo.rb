class Photo < ActiveRecord::Base
	belongs_to :event, :inverse_of => :photos
end
