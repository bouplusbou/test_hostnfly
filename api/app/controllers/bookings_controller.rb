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
            render json: @booking   
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
