#============================================================================
# Keepalive controller
#
class Api::V1::KeepaliveController < Api::V1::ApiController

  # GET /keepalive
  def keepalive
    render json: {status: 'ALIVE'}, status: :ok
  end
end
