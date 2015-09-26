json.array!(@providers) do |provider|
  json.extract! provider, :id, :name, :address, :phone, :email
  json.url provider_url(provider, format: :json)
end
