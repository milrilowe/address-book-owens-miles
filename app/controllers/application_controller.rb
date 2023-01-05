class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def authenticate
    redirect_to root_path, notice: "You must be logged in." unless Current.user
  end

end