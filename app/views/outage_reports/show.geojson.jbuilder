json.type "FeatureCollection"
json.features [@outage_report] do |outage_report|
  json.partial! outage_report
end
