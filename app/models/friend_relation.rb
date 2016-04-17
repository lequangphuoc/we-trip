# == Schema Information
#
# Table name: friend_relations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  target_id  :integer
#  status     :string           default("pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FriendRelation < ActiveRecord::Base
  belongs_to :user
  has_one :target, class_name: User, foreign_key: :id

  validates_presence_of :user_id, :target_id, :status
  validates_inclusion_of :status, in: %w(pending accepted)
end
