class UsersController < ApplicationController
      before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
      before_action :correct_user,   only: [:edit, :update]
      before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate.(page: params[:page])
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
    @microposts = @user.microposts.paginate(page: params[:page])

  end

  def update
    if @user.uodate_attributed(user_params)
      flash[:sucess] = "profile updated"
      redirect_to @user
    else
      render 'edit'
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :confirmation)
  end

   def logged_in_user
     unless logged_in?
       store_location
       flash[:danger] = "pleade log in"
       redirect_to login_url
     end
   end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end


