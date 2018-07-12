require "google/cloud/storage"

class WelcomeController < ApplicationController
	respond_to :json

	BASE_URL = "https://storage.googleapis.com/sktv/"

	def search
		result = PgSearch.multisearch(params[:q])
		parsed_types = {
			"Post": "Novedades",
			"Agent": "Agentes",
  			"Event": "Eventos",
  			"Spot": "Skateparks"
		}
		
		parsed_result = []
		result.to_a.uniq.each do |r|
			model = r["searchable_type"].constantize.find r["searchable_id"]
			search_result = {
				content: "#{r.content[0..25]}...",
				title: model.title,
				img: model.img,
				id: r["searchable_id"],
				type: parsed_types[r["searchable_type"].to_sym]
			}
			if r["searchable_type"] == "Agent"
				search_result[:agent_type] = "#{model.agent_type}s"
			end
			if r["searchable_type"] == "Spot"
				search_result[:region_id] = model.region
			end
			parsed_result << search_result
		end
		render json: {result: parsed_result}
	end

	def banners
		banners = Banner.where("is_agency IS NOT true AND active IS true")
		agency_banner = Banner.where(is_agency: true).last
		render json: {banners: banners, agency_banner: agency_banner}
	end

	def subscribe
		s = Subscriber.create email: params[:email]
		render json: {subscriber: s}
	end

	def about
		photos = about_photos
		render json: {photos: photos}
	end

	private

	def about_photos
			
		photos = []

		storage = Google::Cloud::Storage.new(
			project_id: ENV["GCLOUD_PROJECT_ID"],
			credentials: JSON.parse(ENV["GCLOUD_APPLICATION_CREDENTIALS"])
		)
		bucket = storage.bucket ENV["GCLOUD_BUCKET"]
			
		about_files = bucket.files prefix: "Nosotros"
		
		about_files.all.each do |file|
			file.acl.public!
			order = file.name.gsub(/\D/, '')[0..16].to_i
			if order != 0
				photos << {photo_url: "#{BASE_URL}#{file.name}", filename: file.name, order: order}	
			end
		end

		photos
	end

end
