class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params.to_h)

    if @user_session.save
      redirect_to root_path, notice: "Logged in successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to login_path, notice: "Logged out!"
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end