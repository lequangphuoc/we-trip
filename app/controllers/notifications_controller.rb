class NotificationsController < ApplicationController

	def create
		@target = User.find(params[:receiver_id])
		@notification = Notification.create(name: params[:name], description: params[:description], type: params[:type])
		@target.user_notifications.create(sender_id: params[:current_user.id], notification: @notification)
		respond_to :js
	end

	def read
		respond_to :js
	end

	def delete
		respond_to :js
	end

	def destroy
		Notification.find(params[:id]).destroy
	end

	private
end
