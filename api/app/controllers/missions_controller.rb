class MissionsController < ApplicationController
    before_action :set_mission, only: [:show, :update, :destroy]
    
    def index         # GET /missions
        @missions = Mission.all
        render json: @missions
    end

    def show          # GET /missions/:id
        render json: @mission        
    end

    def create        # POST /missions
        @mission = Mission.new(mission_params)
        @mission.save
        render json: @mission    
    end

    def update        # PATCH /missions/:id
        @mission.update(mission_params)
        render json: @mission        
    end

    def destroy       # DELETE /missions/:id
        id = @mission.id
        @mission.destroy
        render json: {msg: "mission ##{id} deleted"}
    end

    private

    def mission_params
        params.require(:mission).permit(:listing_id, :mission_type, :date, :price)
    end

    def set_mission
        @mission = Mission.find(params[:id])
    end
end
