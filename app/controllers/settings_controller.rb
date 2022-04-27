class SettingsController < ApplicationController
  def index
  end

  def update
    flash[:success] = 'Changes saved!'
    redirect_to settings_path
  end
end
