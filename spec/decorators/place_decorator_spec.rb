require 'spec_helper'

describe PlaceDecorator do
	let(:place) { build(:place).decorate}

  describe '#map_url' do
    it 'should return url' do
      expect(place.map_url).to eq('https://www.google.com/maps/embed/v1/place?q=place_id:test1&key=AIzaSyBrJ4kgKukKBQGXsu7ULAynrPaBz65k3iA')
    end
  end
end
