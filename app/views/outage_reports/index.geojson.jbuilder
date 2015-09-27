json.type "FeatureCollection"
json.features @outage_reports do |outage_report|
  json.partial! outage_report
end
