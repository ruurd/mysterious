class Api::V1::KeepaliveController < Api::V1::ApiController

  def keepalive
    render json: {status: 'ALIVE'}, status: :ok
  end
end
