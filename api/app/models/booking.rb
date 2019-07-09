class Booking < ApplicationRecord
  belongs_to :listing

  before_save :check_dates

  def check_dates
    valid_dates = true
    existing_bookings = Booking.where(listing_id: listing_id)
    existing_bookings.each do |booking|
      if booking.start_date < end_date && booking.end_date > start_date
        valid_dates = false
      end
    end
    valid_dates ? '' : throw(:abort)
  end
end
