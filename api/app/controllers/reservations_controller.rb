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
            render json: @reservation        
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
