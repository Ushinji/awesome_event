class UsersController < ApplicationController
  before_action :authenticate

  def show
    @user = User.find(params[:id])
    render :show
  end
end