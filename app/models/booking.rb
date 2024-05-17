class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue


# def confirm
#   authorize @booking, :confirm?

#   if @booking.update(confirmed: true)
#     redirect_to profile_path(current_user), notice: 'Booking was successfully confirmed.'
#   else
#     redirect_to profile_path(current_user), alert: 'Unable to confirm booking.'
#   end
# end
end
