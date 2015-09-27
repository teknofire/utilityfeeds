class OutageReportsController < ApplicationController
  before_action :set_outage_report, only: [:show, :edit, :update, :destroy]

  # GET /outage_reports
  # GET /outage_reports.json
  def index
    @outage_reports = OutageReport.all

    respond_to do |format|
      format.html
      format.json
      format.geojson
    end
  end

  # GET /outage_reports/1
  # GET /outage_reports/1.json
  def show
    respond_to do |format|
      format.html
      format.geojson
      format.json
    end
  end

  # GET /outage_reports/new
  def new
    @outage_report = OutageReport.new
  end

  # GET /outage_reports/1/edit
  def edit
  end

  # POST /outage_reports
  # POST /outage_reports.json
  def create
    @outage_report = OutageReport.new(outage_report_params)

    respond_to do |format|
      if @outage_report.save
        format.html { redirect_to @outage_report, notice: 'Outage report was successfully created.' }
        format.json { render :show, status: :created, location: @outage_report }
      else
        format.html { render :new }
        format.json { render json: @outage_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outage_reports/1
  # PATCH/PUT /outage_reports/1.json
  def update
    respond_to do |format|
      if @outage_report.update(outage_report_params)
        format.html { redirect_to @outage_report, notice: 'Outage report was successfully updated.' }
        format.json { render :show, status: :ok, location: @outage_report }
      else
        format.html { render :edit }
        format.json { render json: @outage_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outage_reports/1
  # DELETE /outage_reports/1.json
  def destroy
    @outage_report.destroy
    respond_to do |format|
      format.html { redirect_to outage_reports_url, notice: 'Outage report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outage_report
      @outage_report = OutageReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outage_report_params
      params.require(:outage_report).permit(:service_id, :provider_id, :location, :address, :notes, :started_at, :ended_at)
    end
end
