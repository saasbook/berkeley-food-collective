class SessionsController < ApplicationController
  skip_before_action :require_login
  before_action :require_update_airtable, only: [:create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.active
      login user
      redirect_to announcements_path
    else
      flash[:danger] = 'Please enter a valid email address!'
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to login_path
  end

  private

  def require_update_airtable
    User.populate_from_airtable
  end

end

