class ParticipationsController < ApplicationController
  before_action :authenticate

  def create
    event = Event.find(params[:id])
    participation = event.participations.build(user_id: current_user.id)
    if participation.save
      flash[:success] = 'イベントに参加しました'
    else
      flash[:danger] = 'イベント参加に失敗しました。再度参加し直してください。'
    end
    redirect_to "/events/#{event.id}"
  end

end