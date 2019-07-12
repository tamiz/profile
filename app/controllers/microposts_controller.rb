class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def index
    @micropost = Micropost.all
  end

  def create
    @microposts = current.user.microposts.build(micropost_params)
    if @microposts.save
      flash[:sucess] = "Micropost created"
      redirect_to @micropost
    else
      @feed_items = []
      render 'staticpages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:sucess] ="micropost deleted"
    redirect_to request.referrer || root_url
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end
  end


