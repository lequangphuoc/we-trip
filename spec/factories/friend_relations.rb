# == Schema Information
#
# Table name: friend_relations
#
#  id         :integer          not null, primary key
#  status     :string           default("pending")
#  user_id    :integer
#  target_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :friend_relation, class: FriendRelation do
    user_id 1
    target_id 2
  end
end
