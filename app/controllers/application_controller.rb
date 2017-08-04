class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def users
    @users = User.all
    render json: @users
  end

  def create_user
    @user = User.create params.permit(:first_name, :last_name, :email, :birth_date)
    render json: @user
  end

  def update_user
    @user = User.find(params[:id])
    @user.update_attributes(data: params[:data])

    render json: @user
  end
end
