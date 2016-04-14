class UsersController < ApplicationController
  before_action :skip_login, only: [:create]
  before_action :require_login, except: [:create]
  before_action :get_user, only: [:edit, :update]

  def create
    @user = User.create(user_params)
    if @user.save
      store_user_id(@user.id)
    end
    respond_to :js
  end

  def edit
  end

  def friends
      render json: current_user.friends
  end

  def available_friends
      render json: get_possible_friend(params[:search_data])
  end

  def update
    if @user.update_attributes(user_update_params)
      flash[:notice] = 'Update successfully'
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def user_update_params
    params.require(:user).permit(:name, :avatar, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def get_possible_friend(search_data)
    puts(search_data)
    @possible_friends = User.possible_friend(current_user, search_data)
  end
end
