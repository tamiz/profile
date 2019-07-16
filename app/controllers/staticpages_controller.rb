class StaticpagesController < ApplicationController
  def home
    if logged_in?
    @micropost = current_user.microposts.build
      end
  end

  def help
  end

  def about
  end

  def contact
  end

  def login
  end

end
