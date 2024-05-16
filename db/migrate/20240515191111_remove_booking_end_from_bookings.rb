class RemoveBookingEndFromBookings < ActiveRecord::Migration[7.1]
  def change

        remove_column :bookings, :booking_end, :date
      end
    end
