class AgentsController < ApplicationController
	def list
		all_agents = Agent.order(created_at: 'DESC')
		render json: {agents: all_agents}		
	end
end
