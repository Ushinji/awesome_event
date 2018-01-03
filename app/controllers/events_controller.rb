class EventsController < ApplicationController

  def create
    @event = current_user.events.build()
    if @event.save
    
    else

    end
  end

  private

  def event_params

  end
end
