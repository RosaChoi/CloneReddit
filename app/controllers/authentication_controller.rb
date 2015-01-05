class AuthenticationController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully signed in"
    else
      redirect_to signin_path, alert: "Username / password combination is invalid"
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session.destroy
    redirect_to root_path, notice: "You have been signed out"
  end
end
