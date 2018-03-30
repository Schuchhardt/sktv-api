class EventController < ApplicationController

	def list
		filtered_events = Event.all.order(release_date: 'DESC')
							.map { |e| e.slice(:id, :name, :description, :place, :release_date, :cover_url) }
		render json: {events: filtered_events }
	end

	def detail
		event = Event.find params[:event_id]
		render json: {event: event.slice(:id, :name, :description, :featured_image, :text, :place, :release_date, :cover_url, :all_photos ) }
	end

	def photos
		event = Event.find params[:event_id]
		per_page = 12
		if params[:page].present?
			page = params[:page].to_i || 1
			offset = (page * per_page) - per_page
		else
			offset = 0
			limit = 0
			per_page = nil
		end
		photos = Photo.where(event: event).order(:order).limit(per_page).offset(offset).map { |p| p.slice(:id, :photo_url) }
		render json: {photos: photos }
	end
end
