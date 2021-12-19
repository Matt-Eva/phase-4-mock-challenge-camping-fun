class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    
    def create
        signup = Signup.create!(signup_params)
        activity = signup.activity
        render json: activity, status: :created
    end

    private
    
    def unprocessable_entity
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end

    def signup_params
        params.permit(:activity_id, :camper_id, :time)
    end
end
