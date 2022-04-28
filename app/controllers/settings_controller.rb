class SettingsController < ApplicationController
  def index
    @setting = Setting.last
  end

  def update
    @setting = Setting.last
    @setting.airtable_base_id = params[:airtable_base_id]
    @setting.users_table_id = params[:users_table_id]
    @setting.tasks_table_id = params[:tasks_table_id]
    @setting.announcements_table_id = params[:announcements_table_id]
    if params[:password] != ""
      @setting.password = params[:password]
    end
    @setting.save!
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
