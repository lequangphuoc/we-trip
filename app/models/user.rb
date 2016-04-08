class User < ActiveRecord::Base
  has_many :events

  has_secure_password
  mount_uploader :avatar, AvatarUploader
  validates :password, length: {minimum: 8}, presence: true, allow_nil: true
  validates :name, presence: true
  validates :point, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :email, presence: true, uniqueness: true,
            format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end