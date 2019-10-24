json.extract! artwork, :id, :title, :cat, :desc, :price, :imageurl, :sold, :artist_id, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
