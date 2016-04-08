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
  pending "add some examples to (or delete) #{__FILE__}"
end
