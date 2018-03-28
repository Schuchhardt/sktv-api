class AddDataToPgSearch < ActiveRecord::Migration
  def change
  	Agent.find_each { |record| record.update_pg_search_document }
  	Event.find_each { |record| record.update_pg_search_document }
  	Post.find_each { |record| record.update_pg_search_document }
  	Spot.find_each { |record| record.update_pg_search_document }
  end
end
