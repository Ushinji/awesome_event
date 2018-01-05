class EventsController < ApplicationController
  before_action :authenticate, except: :show

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'イベントを作成しました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    return @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :start_time, :end_time, :content)
  end
end
