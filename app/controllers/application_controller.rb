class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  module ApplicationHelper
    def flash_class(level)
      case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
      end
    end
  end

  private
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
     redirect_to 'sessions_new_path'
    end
  end
end


