class AddTripNumberToTrips < ActiveRecord::Migration
  def change
    add_column :historical_trips, :trip_number, :integer
  end
end
