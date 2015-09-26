require 'test_helper'

class OutageReportsControllerTest < ActionController::TestCase
  setup do
    @outage_report = outage_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outage_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outage_report" do
    assert_difference('OutageReport.count') do
      post :create, outage_report: { address: @outage_report.address, ended_at: @outage_report.ended_at, location: @outage_report.location, notes: @outage_report.notes, provider_id: @outage_report.provider_id, service_id: @outage_report.service_id, started_at: @outage_report.started_at }
    end

    assert_redirected_to outage_report_path(assigns(:outage_report))
  end

  test "should show outage_report" do
    get :show, id: @outage_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outage_report
    assert_response :success
  end

  test "should update outage_report" do
    patch :update, id: @outage_report, outage_report: { address: @outage_report.address, ended_at: @outage_report.ended_at, location: @outage_report.location, notes: @outage_report.notes, provider_id: @outage_report.provider_id, service_id: @outage_report.service_id, started_at: @outage_report.started_at }
    assert_redirected_to outage_report_path(assigns(:outage_report))
  end

  test "should destroy outage_report" do
    assert_difference('OutageReport.count', -1) do
      delete :destroy, id: @outage_report
    end

    assert_redirected_to outage_reports_path
  end
end
