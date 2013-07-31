class AlertsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    #respond_with Alert.create(params[:alert])
    alert = Alert.create(params[:alert])
    p alert
    respond_with alert
  end
end