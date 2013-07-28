class GeofenceViolationsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    respond_with GeofenceViolation.create(params[:geofence_violation])
  end
end