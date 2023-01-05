class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path, notice: "Successfully created account."
    else
      redirect_to root_path, notice: "Trouble creating account."
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end