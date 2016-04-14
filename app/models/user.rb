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
  has_many :friends, through: :friend_relations, class_name: User, foreign_key: :target_id

  has_secure_password
  mount_uploader :avatar, AvatarUploader
  validates :password, length: {minimum: 8}, presence: true, allow_nil: true
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true, format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :point, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def self.friends
    User.where('id = (?)', friends.id)
  end

  def self.possible_friend(current_user, search_data)
    where.not(id: FriendRelation.where(user: current_user).pluck(:target_id)).where.not(id: current_user.id).where("name like ? OR email like ?", "%#{search_data}%", "%#{search_data}%")
  end
end
