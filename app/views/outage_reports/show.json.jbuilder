json.extract! @outage_report, :id, :service_id, :provider_id, :location, :address, :notes, :started_at, :ended_at, :created_at, :updated_at
json.service @outage_report.service
json.provider @outage_report.provider
json.reported @outage_report.created_at.strftime('%F %T')
