json.type 'Feature'
json.geometry outage_report.wkt
json.properties do
  json.set! 'marker-color', outage_report.service.color
  json.url outage_report_url(outage_report)
end
