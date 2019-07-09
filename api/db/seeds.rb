input = {
  "listings": [
    { "id": 1, "num_rooms": 2 },
    { "id": 2, "num_rooms": 1 },
    { "id": 3, "num_rooms": 3 }
  ],
  "bookings": [
    { "id": 1, "listing_id": 1, "start_date": "2016-10-10", "end_date": "2016-10-15" },
    { "id": 2, "listing_id": 1, "start_date": "2016-10-16", "end_date": "2016-10-20" },
    { "id": 3, "listing_id": 2, "start_date": "2016-10-15", "end_date": "2016-10-20" }
  ],
  "reservations": [
    { "id": 1, "listing_id": 1, "start_date": "2016-10-11", "end_date": "2016-10-13" },
    { "id": 2, "listing_id": 1, "start_date": "2016-10-13", "end_date": "2016-10-15" },
    { "id": 3, "listing_id": 1, "start_date": "2016-10-16", "end_date": "2016-10-20" },
    { "id": 4, "listing_id": 2, "start_date": "2016-10-15", "end_date": "2016-10-18" }
  ]
}

puts 'Creating listings...'
input[:listings].each do |listing|
    new_listing = Listing.new(**listing)
    new_listing.save!
end
puts 'Finished!'

puts 'Creating bookings...'
input[:bookings].each do |booking|
    new_booking = Booking.new(**booking)
    new_booking.save!
end
puts 'Finished!'

puts 'Creating reservations...'
input[:reservations].each do |reservation|
    new_reservation = Reservation.new(**reservation)
    new_reservation.save!
end
puts 'Finished!'