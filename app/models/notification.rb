# == Schema Information
#
# Table name: notifications
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  category    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Notification < ActiveRecord::Base
	has_many :user_notifications, dependent: :destroy

	validates_presence_of :name, :description
	validates_inclusion_of :category, in: %w(request news)
end
