class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :update, :destroy]
    
    def index         # GET /bookings
        @bookings = Booking.all
        render json: @bookings
    end

    def show          # GET /bookings/:id
        render json: @booking        
    end

    def create        # POST /bookings
        @booking = Booking.new(booking_params)
        if @booking.save
            Mission.create(listing_id: @booking.listing_id, mission_type: "first_checkin", date: @booking.start_date, price: 10)
            Mission.create(listing_id: @booking.listing_id, mission_type: "last_checkout", date: @booking.end_date, price: 10)
            render json: {booking: @booking, msg: "booking and missions first_checkin and last_checkout created"}  
        else 
            render json: {msg: "booking aborted"}
        end     
    end

    def update        # PATCH /bookings/:id
        @booking.update(booking_params)
        render json: @booking        
    end

    def destroy       # DELETE /bookings/:id
        id = @booking.id
        @booking.destroy
        render json: {msg: "booking ##{id} deleted"}
    end

    private

    def booking_params
        params.require(:booking).permit(:listing_id, :start_date, :end_date)
    end

    def set_booking
        @booking = Booking.find(params[:id])
    end
end
