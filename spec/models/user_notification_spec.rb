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

require 'rails_helper'

RSpec.describe UserNotification, type: :model do
end
