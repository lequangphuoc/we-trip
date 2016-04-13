# == Schema Information
#
# Table name: attractions
#
#  id              :integer          not null, primary key
#  schedule_day_id :integer
#  place_id        :integer
#  index           :integer
#  hour_spend      :decimal(, )      default("1")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Attraction, type: :model do
  it { should belong_to(:schedule_day) }
  it { should belong_to(:place) }
  it { should validate_presence_of(:place_id) }
  it { should validate_presence_of(:schedule_day_id) }
  it { should validate_presence_of(:index) }
  it { should validate_numericality_of(:hour_spend) }
end
