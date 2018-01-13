class PostsController < ApplicationController

	def list
		all_posts = Post.order(release_date: 'DESC')
							.map { |e| e.slice(:id, :title, :subtitle, :image_url, :created_at, :text, :second_text) }
		render json: {posts: all_posts}		
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

	def detail
		post = Post.find params[:post_id]
		rp = Post.where.not(id: params[:post_id]).limit(3)
		render json: {post: post.slice(:id, :title, :subtitle, :text, :second_text, :image_url, :created_at ), related_posts: rp }
	end

end
