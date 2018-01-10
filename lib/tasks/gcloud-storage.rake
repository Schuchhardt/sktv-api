# rake storage:sync_events
require "google/cloud/storage"

namespace :storage do
  desc "Test google storage"
  task :sync_events => :environment do

  	BASE_URL="https://storage.googleapis.com/sktv/Eventos/"
	
	storage = Google::Cloud::Storage.new(
		project_id: ENV["GCLOUD_PROJECT_ID"],
		credentials: "#{Rails.root}/config/#{ENV['GCLOUD_CREDENTIAL_FILE']}"
	)
	bucket = storage.bucket ENV["GCLOUD_BUCKET"]


	Event.all.each do |event|
		if event.code_name
			
			event_files = bucket.files prefix: "Eventos/#{event.code_name}"
		
			event_files.all.each do |file|
				file.acl.public!
				puts file.name
				Photo.create(photo_url: "#{BASE_URL}#{event.code_name}/#{file.name}", event_id: event.id)
			end
		end
	end
  end
end

