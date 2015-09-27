json.type 'Feature'
json.geometry outage_report.wkt
json.properties do
  json.url outage_report_url(outage_report)
end
