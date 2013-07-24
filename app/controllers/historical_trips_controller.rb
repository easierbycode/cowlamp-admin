class HistoricalTripsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    respond_with HistoricalTrip.create(params[:historical_trip])
  end
end