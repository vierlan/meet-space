class RemoveBookingEndFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :booking_end, :date
    remove_column :bookings, :booking_start, :date
  end
end
