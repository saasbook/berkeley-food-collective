class SessionsController < ApplicationController
  def new
  end

  def create
    redirect_to announcements_path
  end

  def destroy
  end
end
