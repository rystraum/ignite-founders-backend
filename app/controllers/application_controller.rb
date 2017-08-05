class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  def users
    @users = User.all
    render json: @users
  end

  def create_user
    user = User.find_by(email: params[:email])
    @user = user || User.create(params.permit(:first_name, :last_name, :email, :birth_date))
    render json: @user
  end

  def update_user
    user = User.find_by(params[:id])
    user ||= User.create(params.require(:registrationParams).permit(:firstName, :lastName, :email, :birthDate))
    data = {
      activityProgress: params[:activityProgress],
      gifts: params[:gifts],
      connections: params[:connections],
    }

    user.update_attributes(data: data.as_json)

    render json: user
  end
end
