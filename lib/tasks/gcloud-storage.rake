# rake gcloud:storage
require "google/cloud/storage"

namespace :gcloud do
  desc "Test google storage"
  task :storage => :environment do
	storage = Google::Cloud::Storage.new(
	  project_id: "sktv-189602",
	  credentials: "#{Rails.root}/config/sktv-sa.json"
	)
	bucket = storage.bucket "sktv"
	#eventos = bucket.files prefix: "Eventos/"

	#puts eventos.all(request_limit: 5).inspect
	file = bucket.file "Eventos/BestrickTourLife20Park/1.jpg"
	file.acl.public!
	public_url = file.public_url
	puts public_url.inspect
  end
end
