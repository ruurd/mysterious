class Api::V1::ApiController < ActionController::Base

  # Only respond to JSON
  respond_to :json

  # Signal unfindable records with a 404
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: exception, status: :not_found
  end

  # Signal unauthorized access with a 403
  rescue_from CanCan::AccessDenied do |exception|
    render json: exception, status: :forbidden
  end

end
