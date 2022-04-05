class UserController < ApplicationController
  def airtable_update
    User.populate_from_airtable
    flash[:success] = 'User Database Updated!'
    redirect_to login_path
  end
end
