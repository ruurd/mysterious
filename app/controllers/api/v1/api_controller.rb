#============================================================================
# API controller. Base class for all API controllers
#
class Api::V1::ApiController < ActionController::Base

  # Only respond to JSON
  respond_to :json

  # Signal unfindable records with a 404
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: exception, status: :not_found
  end

  # Signal unprocessable when statement invalid
  rescue_from ActiveRecord::StatementInvalid do |exception|
    render json: exception, status: :unprocessable_entity
  end

  # Signal unauthorized access with a 403
  rescue_from CanCan::AccessDenied do |exception|
    render json: exception, status: :forbidden
  end

end
