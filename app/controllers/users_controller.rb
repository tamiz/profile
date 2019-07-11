class UsersController < ApplicationController



  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      UserNotifierMailer.user_notifier_mailer(@user).deliver
      redirect_to(@user, :notice => 'user created')
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def login
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :confirmation)
  end

end
