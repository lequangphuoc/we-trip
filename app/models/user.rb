# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  description     :text
#  point           :integer          default("0")
#  avatar          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :friend_relations
  has_many :user_trips
  has_many :trips, through: :user_trips
  has_many :user_notifications
  has_many :friends, through: :friend_relations, class_name: User, source: :target
  has_many :notifications, through: :user_notifications, class_name: Notification, source: :notification
  has_many :user_budgets, dependent: :destroy
  has_many :providers

  has_secure_password
  mount_uploader :avatar, AvatarUploader
  validates :password, length: {minimum: 8}, presence: true, allow_nil: true
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true, format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :point, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def self.possible_friend(current_user, search_data)
    where.not(id: FriendRelation.where(user: current_user).pluck(:target_id)).where.not(id: current_user.id)
        .where("name like ? OR email like ?", "%#{search_data}%", "%#{search_data}%").order(:name)
  end

  def notifications_with_senders
    self.user_notifications.preload(:notification, :sender)
  end

  def friends_not_in_trip(trip_id)
    User.find(
        friends.pluck(:id) - UserTrip.where(trip_id: trip_id).pluck(:user_id)
    )
  end

  def self.get_top_7_contributor
    order(point: :desc).limit(7)
  end

  def authenticate_facebook?
    self.providers.find_by(name: 'facebook')
  end

  def total_amount_to_pay
    self.user_budgets.reduce(0) { |amount, budget| amount + budget.price }
  end
end
