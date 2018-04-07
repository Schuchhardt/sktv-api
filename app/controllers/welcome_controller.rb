class WelcomeController < ApplicationController
	respond_to :json

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
		puts parsed_result.inspect
		render json: {result: parsed_result}
	end

	def banners
		banners = Banner.where(active: true)
		render json: {banners: banners}
	end

	def subscribe
		s = Subscriber.create email: params[:email]
		render json: {subscriber: s}
	end

end
