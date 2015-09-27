class WelcomeController < ApplicationController
  layout 'map'

  def index
    @outage_report = OutageReport.new
    @layers = [{ type: 'geojson', url: outage_reports_path(:geojson)}]
  end
end
