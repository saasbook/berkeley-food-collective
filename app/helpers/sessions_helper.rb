module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def logout
<<<<<<< HEAD
    session[:user_id] = nil
=======
    session.delete(:user_id)
>>>>>>> dc8d77f71cdabded9bc43a71a0e7845978ba059c
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!@current_user
  end
end
