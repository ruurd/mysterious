class Api::V1::SessionsController < Devise::SessionsController

  # Only respond to JSON
  respond_to :json

  # Don't do CSRF checks on this
  skip_before_action :verify_authenticity_token

  # Create a user session
  # POST /api/v1/sessions.json
  def create
    super
  end

  # Destroy the user session
  # DELETE /api/v1/sessions.json
  def destroy
    super
  end

  # Signal failure to login
  def failure
    render :json => {:success => false, :errors => ["Login Failed"]}, status: :unauthorized
  end

  protected

  # Adjust options so that recall points to failure
  def auth_options
    {scope: resource_name, recall: "#{controller_path}#failure"}
  end
end