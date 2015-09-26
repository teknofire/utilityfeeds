json.array!(@outage_reports) do |outage_report|
  json.extract! outage_report, :id, :service_id, :provider_id, :location, :address, :notes, :started_at, :ended_at
  json.url outage_report_url(outage_report, format: :json)
end
