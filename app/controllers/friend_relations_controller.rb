class FriendRelationsController < ApplicationController
  before_action :require_login
  before_action :get_service

  def create
    @friend_relation = @service.create
    respond_to :js
  end

  def confirm
    @friend_relation = @service.confirm
    respond_to :js
  end

  def reject
    @success = @service.reject
    respond_to :js
  end

  private
  def get_service
    @service = FriendRelationsService.new(current_user, params[:target_id])
  end
end
