json.array!(@services) do |service|
  json.extract! service, :id, :name, :slug
  json.url service_url(service, format: :json)
end
