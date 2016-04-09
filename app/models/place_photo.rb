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

class PlacePhoto < ActiveRecord::Base
  belongs_to :place

  validates_presence_of :height, :width, :place_id, :photo_reference
end
