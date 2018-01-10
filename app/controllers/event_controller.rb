class EventController < ApplicationController

	def list
		filtered_events = Event.all.map { |e| e.slice(:id, :name, :description, :place, :release_date, :cover_url)
		render json: {events: filtered_events }}
	end

	def detail
		event = Event.find params[:event_id]
		render json: {event: e.slice(:id, :name, :description, :place, :release_date, :cover_url, :all_photos }}
	end
end
