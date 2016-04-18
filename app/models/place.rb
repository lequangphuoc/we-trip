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

class Place < ActiveRecord::Base
  belongs_to :region
  has_many :place_photos, dependent: :destroy
  has_one :display_photo, -> { limit(1) }, class_name: PlacePhoto

  validates_presence_of :name, :latitude, :longitude, :vicinity,
                        :region_id, :description, :rating
end
