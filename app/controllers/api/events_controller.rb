class Api::EventsController < ApplicationController
  #how to do in production?
  skip_before_action :verify_authenticity_token
  before_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access_Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'Post, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def create
    app = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    if app 
      @event = app.events.create(event_params)
      if @event.persisted?
        #checking if @event has an id
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    else
      render json: "Unregistered application", status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.require(:event).permit(:name)
  end
end
