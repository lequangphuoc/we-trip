class SessionsController < ApplicationController
  before_action :skip_login, only: [:create]
  before_action :require_login, only: [:destroy]

  def create
    @authenticate = authenticate
    store_user_id(@user.id) if @authenticate
    respond_to :js
  end

  def callback
    service = FacebookAuthenticateService.new(env['omniauth.auth'])
    user = current_user || service.authenticate
    if user
      service.create_provider(user)
      store_user_id(user.id)
    else
      flash[:alert] = 'Can not login with facebook'
    end
    redirect_to_previous
  end

  def destroy
    clear_user_id
    flash[:notice] = 'Logout successfully'
    redirect_to root_path
  end

  private
  def redirect_to_previous
    begin
      redirect_to :back
    rescue ActionController::RedirectBackError => e
      redirect_to root_path
    end
  end

  def authenticate
    @user = User.find_by(email: params[:email])
    @user && @user.authenticate(params[:password])
  end
end
