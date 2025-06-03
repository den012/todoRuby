# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #check captcha
    if verify_recaptcha(action: 'signup', minimum_score: 0.5, model: @user) && @user.save
      redirect_to login_path, notice: "Signup successful!"
    else
      flash.now[:alert] = "Captcha verification failed or signup error."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end