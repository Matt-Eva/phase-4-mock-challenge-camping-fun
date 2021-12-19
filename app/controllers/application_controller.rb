class ApplicationController < ActionController::API
  include ActionController::Cookies
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

private

def not_found(exception_obj)
  render json: {error: "#{exception_obj.model} not found"}, status: :not_found
end

def unprocessable_entity(invalid)
  render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
end

end
