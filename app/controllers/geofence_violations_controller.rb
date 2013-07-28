class GeofenceViolationsController < ApplicationController

  def create
    respond_with GeofenceViolation.create(params[:geofence_violation])
  end
end