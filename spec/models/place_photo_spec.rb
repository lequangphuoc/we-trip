# == Schema Information
#
# Table name: place_photos
#
#  id              :integer          not null, primary key
#  place_id        :integer
#  photo_reference :string
#  height          :integer
#  width           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe PlacePhoto, type: :model do
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:width) }
  it { should validate_presence_of(:place_id) }
  it { should validate_presence_of(:photo_reference) }
  it { should belong_to(:place) }
end
