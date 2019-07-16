class MicropostsController < ApplicationController
  before_action :logged_in_user

  def index
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created"
      redirect_to @micropost
    else
      @feed_items = []
      render 'staticpages/home'
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end



  def destroy
    @micropost.destroy
    flash[:notice] ="micropost deleted"
    redirect_to request.referrer || root_url
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end
  end


