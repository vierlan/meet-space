class AddTimesToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :start_time, :string
    add_column :bookings, :end_time, :string
  end
end
