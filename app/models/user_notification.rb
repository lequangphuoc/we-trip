class UserNotification < ActiveRecord::Base
  belongs_to :notification
  belongs_to :user
  belongs_to :sender, class_name: "User"

  validates_presence_of :user_id, :notification_id, :sender_id
end
