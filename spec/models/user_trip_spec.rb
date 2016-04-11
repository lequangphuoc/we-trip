# == Schema Information
#
# Table name: user_trips
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe UserTrip, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:trip) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:trip_id) }
end
