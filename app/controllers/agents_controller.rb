class AgentsController < ApplicationController
	def list
		all_agents = Agent.order(created_at: 'DESC')
		render json: {agents: all_agents}		
	end

	def list_type
		all_agents = Agent.where(agent_type: params[:agent_type][0..-2]).order(created_at: 'DESC')
		render json: {agents: all_agents}		
	end

	def detail
		agent = Agent.find params[:agent_id]
		render json: {agent: agent.slice(:id, :name, :age, :phone, :email, :instagram, :facebook, :youtube, :featured_image, :text, :aditional_text, :photo_url, :quote, :agent_type, :photos, :youtube_iframe_url)}		
	end
end
