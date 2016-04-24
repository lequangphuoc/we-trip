require 'spec_helper'

describe PlacePhotoDecorator do
  before(:each) do
    @place_photo = build(:place_photo).decorate
    @place_photo.place = build(:place)
  end

  describe '#place_name' do
    it 'should return place name' do
      expect(@place_photo.place_name).to eq('Tra Sua')
    end
  end
end
