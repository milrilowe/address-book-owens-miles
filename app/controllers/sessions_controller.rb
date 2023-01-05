class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.js # render new.js.erb
    end
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Successfully logged in."
    else
      redirect_to root_path, notice: "Trouble logging in."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out."
  end
end