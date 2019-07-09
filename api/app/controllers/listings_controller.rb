class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :update, :destroy]
    
    def index         # GET /listings
        @listings = Listing.all
        render json: @listings
    end

    def show          # GET /listings/:id
        render json: @listing        
    end


    def create        # POST /listings
        @listing = Listing.new(listing_params)
        @listing.save
        render json: @listing        
    end

    def update        # PATCH /listings/:id
        @listing.update(listing_params)
        render json: @listing        
    end

    def destroy       # DELETE /listings/:id
        id = @listing.id
        @listing.destroy
        render json: {msg: "listing ##{id} deleted"}
    end

    private

    def listing_params
        params.require(:listing).permit(:num_rooms)
    end

    def set_listing
        @listing = Listing.find(params[:id])
    end
end
