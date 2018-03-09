class AgentsController < ApplicationController
	def list
		all_agents = Agent.order(created_at: 'DESC')
		render json: {agents: all_agents}		
	end

	def list_type
		all_agents = Agent.where(agent_type: params[:agent_type]).order(created_at: 'DESC')
		render json: {agents: all_agents}		
	end

	def detail
		agent = Agent.find params[:agent_id]
		render json: {agent: agent}		
	end
end
