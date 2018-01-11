class NewsController < ApplicationController

	def feed
		instagram_feed = []
		InstagramApi.user(ENV['INSTAGRAM_USER_ID']).recent_media.data.each do |recent_media|
			instagram_feed << {
				link: recent_media.link,
				caption: recent_media.caption.text,
				image: recent_media.images.standard_resolution.url,
				likes: recent_media.likes.count
			}	
		end
		render json: {instagram_feed: instagram_feed }
	end

end
