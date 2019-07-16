class UsersController < ApplicationController
      before_action :logged_in_user, only: [:edit, :update]
  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    # if @user.save
    #   # render js: "alert('successfully Registered');"
    redirect_to @user
    # else
    #   render 'new'
    # end
  end

  def show
    @user = User.find(params[:id])
  #  @microposts = @user.microposts.paginate(page: params[:page])
  end

  def update
    if @user.update_attribute(user_params)
      flash[:success] = "profile updated"
      redirect_to @user
    else
      render 'edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :confirmation)
  end


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end


