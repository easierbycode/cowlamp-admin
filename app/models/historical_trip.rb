class HistoricalTrip < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_protected :created_at

  before_save :add_trip_number
  before_save :check_geofence_violations

  def check_geofence_violations
    self.has_geofence_violations = boundary_violations?
  end

  def add_trip_number
    self.trip_number = HistoricalTrip.where({device_id: device_id}).count + 1
  end

  # check to see if
  # we exited any boundaries
  def boundary_violations?
    violated_a_boundary = 0

    geofence_violations = GeofenceViolation.where({ trip_start_at:start_at })

    if geofence_violations.count > 0
      geofence_ids = geofence_violations.pluck('geofence_id')

      for geofence_id in geofence_ids
        if Geofence.is_boundary(geofence_id)
          violated_a_boundary = 1
        end
      end
    end

    return violated_a_boundary
  end

end
