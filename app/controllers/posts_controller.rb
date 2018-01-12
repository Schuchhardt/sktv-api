class PostsController < ApplicationController

	def list
		filtered_news = Post.order(release_date: 'DESC')
							.map { |e| e.slice(:id, :title, :subtitle, :image_url, :created_at, :description, :text1, :text2) }
		render json: {news: filtered_news}		
	end

	def recent
		featured = Post.where(featured: true).first
		filtered_news = Post.where("featured IS NOT true").order(release_date: 'DESC').limit(9)
							.map { |e| e.slice(:id, :title, :subtitle, :image_url, :created_at) }
		instagram_feed = InstagramApi.user(ENV['INSTAGRAM_USER_ID']).recent_media.data.first.link.gsub('https://www.instagram.com/p/', '')
		render json: {recent_news: filtered_news, featured: featured, instagram_feed: instagram_feed }
	end

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
