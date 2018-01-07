class EventsController < ApplicationController
  before_action :authenticate, except: :show

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'イベントを作成しました'
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.paginate(page: params[:page])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      flash[:success] = 'イベントを編集を行いました。'
      render 'show'
    else
      flash[:success] = 'イベントを作成に失敗しました'
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :start_time, :end_time, :content)
  end
end
