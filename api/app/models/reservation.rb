class Reservation < ApplicationRecord
  belongs_to :listing

  before_save :check_dates

  def check_dates
    valid_reservation_dates = true
    existing_reservations = Reservation.where(listing_id: listing_id)
    existing_reservations.each do |reservation|
      if reservation.start_date < end_date && reservation.end_date > start_date
        valid_reservation_dates = false
      end
    end

    valid_booking_dates = false
    bookings = Booking.where(listing_id: listing_id)
    bookings.each do |booking|
      if booking.start_date <= start_date && booking.end_date >= end_date
        valid_booking_dates = true
      end
    end

    valid_reservation_dates && valid_booking_dates ? '' : throw(:abort)
  end
end
