class EventController < ApplicationController

	def list
		render json: {events: Event.all.map { |e| e.slice(:id, :name, :description, :place, :created_at, :cover_url)  }}

	end
end
