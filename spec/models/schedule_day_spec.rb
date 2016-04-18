# == Schema Information
#
# Table name: schedule_days
#
#  id         :integer          not null, primary key
#  index      :integer
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ScheduleDay, type: :model do
  it { should respond_to(:trip) }
  it { should validate_presence_of(:trip_id) }
  it { should validate_presence_of(:index) }
  it { should have_many(:attractions) }
end
