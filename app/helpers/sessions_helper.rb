module SessionsHelper
  def current_user_id
    session[:user_id]
  end

  def store_user_id(id)
    session[:user_id] = id
  end

  def set_current_screen(screen_id)
    session[:current_screen] = screen_id
  end

  def current_screen
    session[:current_screen] ? session[:current_screen] : 'basic_info'
  end

  def clear_user_id
    session[:user_id] = nil
  end
end