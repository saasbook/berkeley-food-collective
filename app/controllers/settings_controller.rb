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
      @setting.categories = params[:categories]
      if not @setting.save # @setting.save should return false if validation fails
        flash[:danger] = @setting.errors.full_messages.to_sentence
        redirect_to settings_path
      else
        flash[:success] = "successfully updated settings!"
        redirect_to settings_path
      end
    else
      flash[:danger] = "incorrect password!"
      redirect_to settings_path
    end
  end

  def update_password 
    @setting = Setting.last

    if @setting.password == params[:password]
      @setting.new_password = params[:new_password]
      @setting.new_password_confirmation = params[:new_password_confirmation]
      @setting.password = params[:new_password]
      if not @setting.save(context: :update_password) #@setting.save should return false if validation fails
        flash[:danger] = @setting.errors.full_messages.to_sentence
        redirect_to update_password_path
      else
        flash[:success] = "Successfully updated admin password!"
        redirect_to update_password_path
      end
    else #wrong password
      flash[:danger] = "Incorrect password!"
      redirect_to update_password_path
    end
end
end
