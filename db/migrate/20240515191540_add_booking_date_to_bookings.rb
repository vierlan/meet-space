class AddBookingDateToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :booking_date, :date
  end
end
