class NewsController < ApplicationController

	def feed
		instagram_feed = []
		InstagramApi.user(ENV['INSTAGRAM_USER_ID']).recent_media.data.each_with_index do |recent_media, index|
			next if index > 17
			instagram_feed << {
				link: recent_media.link,
				caption: recent_media.caption.text,
				image: recent_media.images.standard_resolution.url,
				likes: recent_media.likes["count"],
				comments: recent_media.comments["count"],
				type: recent_media.type
			}	
		end
		render json: {instagram_feed: instagram_feed }
	end

end
