class CampersController < ApplicationController

    def index
        @campers = Camper.all
        render json: @campers.to_json(except: [:created_at, :updated_at])
    end

    def create
        @camper = Camper.new(camper_params)
        if @camper.valid?
            @camper.save
            render json: @camper.to_json(except: [:created_at, :updated_at]), status: :created
        else
            render json: {
                "errors": ["validation errors"]
            }, status: :unprocessable_entity
        end
    end

    def show
        @camper = Camper.find_by(id: params[:id])
        if @camper
            render json: @camper.profile
        else
            render json: {
                "error": "Camper not found"
            }, status: :not_found
        end
    end

    private
    def camper_params
        params.permit(:name,:age)
    end

end
