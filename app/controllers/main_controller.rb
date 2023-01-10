class MainController < ApplicationController
  def index
    if session[:user_id] && User.find_by(id: session[:user_id])
      @user = User.find_by(id: session[:user_id])
      @people = @user.people
    else
      @user = User.new
    end
  end
end