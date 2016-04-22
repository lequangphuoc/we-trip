# == Schema Information
#
# Table name: user_notifications
#
#  id              :integer          not null, primary key
#  notification_id :integer
#  user_id         :integer
#  sender_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UserNotification < ActiveRecord::Base
  belongs_to :notification
  belongs_to :user
  belongs_to :sender, class_name: "User"

  validates_presence_of :user_id, :notification_id, :sender_id
end
