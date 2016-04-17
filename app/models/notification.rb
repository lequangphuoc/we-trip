class Notification < ActiveRecord::Base
	has_many :user_notifications, dependent: :destroy

	validates_presence_of :name, :description
	validates_inclusion_of :category, in: %w(request news)
end
