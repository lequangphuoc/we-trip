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
  has_many :events

  has_secure_password
  mount_uploader :avatar, AvatarUploader
  validates :password, length: {minimum: 8}, presence: true, allow_nil: true
  validates :name, presence: true
  validates :email, uniqueness: true, format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :point, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
