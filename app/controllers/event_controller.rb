class EventController < ApplicationController

	def list
		render json: {events: Event.all}

	end
end
