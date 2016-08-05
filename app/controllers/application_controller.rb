class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def editor_is_moderator!
    unless current_user.id == Sub.find(params[:id]).moderator.id
      flash[:notices] = "keep your hand to yourself!!!!!!!"
      redirect_to subs_url
    end
  end

  def require_login!
    unless logged_in?
      flash[:notices] = "most be logged_in!!!!!!!"
      redirect_to :back
    end
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    session[:session_token] = user.session_token
  end
  def logout(user)
    user.reset_session_token!
    session[:session_token] = nil
  end
end
