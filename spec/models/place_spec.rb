# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  name           :string
#  location_id    :string
#  rating         :decimal(, )
#  latitude       :decimal(, )
#  longitude      :decimal(, )
#  vicinity       :string
#  description    :text
#  region_id      :integer
#  default_budget :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Place, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:vicinity) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:region_id) }
  it { should belong_to(:region) }
  it { should have_many(:place_photos).dependent(:destroy) }
end
