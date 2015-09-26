class WelcomeController < ApplicationController
  def index
    @outage_report = OutageReport.new
  end
end
