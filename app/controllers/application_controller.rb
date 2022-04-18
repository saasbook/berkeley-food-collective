class ApplicationController < ActionController::Base
  include SessionsHelper

  append_before_action :require_login

  private

  def require_login
    unless current_user
      flash[:danger] = 'Please log in to access this page.'
      redirect_to root_path
    end
  end

end
