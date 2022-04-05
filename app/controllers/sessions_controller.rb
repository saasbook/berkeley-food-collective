class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user
      login user
      redirect_to announcements_path
    else
      flash[:danger] = 'Please enter a valid email address!'
      redirect_to login_path
    end
  end

  def airtable_update
    flash[:success] = "User Database Updated!" # might want to make flash message green!
    User.populate_from_airtable
    redirect_to login_path
  end

  def destroy
  end
end
