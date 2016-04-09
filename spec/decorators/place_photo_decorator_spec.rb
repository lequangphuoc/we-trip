require 'spec_helper'

describe PlacePhotoDecorator do
  before(:each) do
    @place = create(:place).decorate
    @place_photo = create(:place_photo).decorate
    @place_photo.place_id = @place.id
  end

  describe '#place_name' do
    it 'should return place name' do
      expect(@place_photo.place_name).to eq('Tra Sua')
    end
  end

  describe '#url' do
    it 'should return url' do
      expect(@place_photo.url).to eq('https://maps.googleapis.com/maps/api/place/photo?maxheight=720&photoreference=test1&key=AIzaSyBrJ4kgKukKBQGXsu7ULAynrPaBz65k3iA')
    end
  end
end
