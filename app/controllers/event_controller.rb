class EventController < ApplicationController

	def list
		render json: {events: Event.all.map { |e| e.slice(:id, :name, :description, :place, :release_date, :cover_url)  }}
	end
end
