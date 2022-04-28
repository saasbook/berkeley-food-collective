class SettingsController < ApplicationController
  def index
  end

  def update
    flash[:success] = 'Changes saved!'
    redirect_to settings_path
  end

  def authenticate 
    @setting = Setting.last
    if @setting.password == params[:password]
        redirect_to settings_path
    else
        flash[:danger] = "incorrect password!"
        redirect_to admin_auth_path
    end
end
end
