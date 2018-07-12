class PostsController < ApplicationController

	def list
		all_posts = Post.order(release_date: 'DESC')
							.map { |e| e.slice(:id, :title, :subtitle, :image_url, :created_at, :text, :second_text) }
		render json: {posts: all_posts}		
	end

	def recent
		cover = Post.where(is_cover: true).last
		featured = Post.where(featured: true).sample(3)
		filtered_news = Post.where("featured IS NOT true AND is_cover IS NOT true").order(release_date: 'DESC').limit(9)
							.map { |e| e.slice(:id, :title, :subtitle, :image_url, :created_at) }
		begin
			req = HTTParty.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
			instagram_feed = JSON.parse(req.body)['data'].first['link'].gsub('https://www.instagram.com/p/', '')
		rescue Exception => e
			puts e.inspect
			puts e.backtrace
			instagram_feed = false
		end
		render json: {cover: cover, recent_news: filtered_news, featured: featured, instagram_feed: instagram_feed }
	end

	def detail
		post = Post.find params[:post_id]
		rp = Post.where(recommended: true).where.not(id: params[:post_id]).sample(3)
		render json: {post: post.slice(:id, :title, :subtitle, :text, :second_text, :image_url, :created_at, :photos, :place , :youtube_iframe_url), related_posts: rp }
	end

end
