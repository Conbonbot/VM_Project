class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Project Stardust"
      redirect_to @user
    else
      render 'new'
    end
  end

  def help
  end

  def about
  end

  def show
    @user = User.find_by(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :student_id, :password, :password_confirmation)
  end
end
