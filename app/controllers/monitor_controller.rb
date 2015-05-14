class MonitorController < ApplicationController

  def keepalive
    render text: 'OK'
  end
end
