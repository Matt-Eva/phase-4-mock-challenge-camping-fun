class CampersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: SingleCamperSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def unprocessable_entity
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end

end
