class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :update, :destroy]
    
    def index         # GET /reservations
        @reservations = Reservation.all
        render json: @reservations
    end

    def show          # GET /reservations/:id
        render json: @reservation        
    end

    def create        # POST /reservations
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            if Mission.find_by(listing_id: @reservation.listing_id, mission_type: "last_checkout", date: @reservation.end_date)
                render json: {booking: @reservation, msg: "reservation created - do not need mission checkout_checkin"}
            else
                Mission.create(listing_id: @reservation.listing_id, mission_type: "checkout_checkin", date: @reservation.end_date, price: 5)
                render json: {booking: @reservation, msg: "reservation and mission checkout_checkin created"}  
            end 
        else 
            render json: {msg: "reservation aborted"}
        end
    end

    def update        # PATCH /reservations/:id
        @reservation.update(reservation_params)
        render json: @reservation        
    end

    def destroy       # DELETE /reservations/:id
        id = @reservation.id
        @reservation.destroy
        render json: {msg: "reservation ##{id} deleted"}
    end

    private

    def reservation_params
        params.require(:reservation).permit(:listing_id, :start_date, :end_date)
    end

    def set_reservation
        @reservation = Reservation.find(params[:id])
    end
end
