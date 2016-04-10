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

require 'rails_helper'

RSpec.describe FriendRelation, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:target_id) }
  it { should validate_presence_of(:status) }
  it { should belong_to(:user) }
  it { should validate_inclusion_of(:status).in_array(%w(pending accepted)) }
  it { should have_one(:target).class_name(User).with_foreign_key(:target_id) }
end
