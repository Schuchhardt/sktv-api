class SkateparksController < ApplicationController

	def list
		filtered_spots = Spot.all.where(region: params[:region_id])
		render json: {skateparks: filtered_spots }
	end

	def detail
		skatepark = Spot.find params[:skatepark_id]
		render json: {skatepark: skatepark.slice(:id, :name, :commment, :city, :image_url, :location, :address, :city, :photos, :map_url, :region, :flaitometro) }
	end
end
