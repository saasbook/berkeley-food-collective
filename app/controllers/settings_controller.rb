class SettingsController < ApplicationController
  def index
    @setting = Setting.last
  end

  def update
    @setting = Setting.last
    if @setting.password == params[:password]
      @setting.airtable_base_id = params[:airtable_base_id]
      @setting.users_table_id = params[:users_table_id]
      @setting.tasks_table_id = params[:tasks_table_id]
      @setting.announcements_table_id = params[:announcements_table_id]
      @setting.save!
      flash[:success] = "successfully updated settings!"
      redirect_to settings_path
    else
      flash[:danger] = "incorrect password!"
      redirect_to settings_path
    end
  end

  def update_password 
    @setting = Setting.last
    
    if @setting.password == params[:password]
      if params[:new_password] == params[:confirm_new_password]
        if params[:new_password] != ""
          @setting.password = params[:new_password]
          @setting.save!
          flash[:success] = "Successfully updated admin password!"
          redirect_to update_password_path
        else
          flash[:danger] = "Please enter and confirm your new password"
          redirect_to update_password_path
        end
      else #passwords dont match
        flash[:danger] = "Please make sure the 'New Password' and 'Confirm New Password' fields match"
        redirect_to update_password_path
      end
    else #wrong password
      flash[:danger] = "Incorrect password!"
      redirect_to update_password_path
    end
end
end
